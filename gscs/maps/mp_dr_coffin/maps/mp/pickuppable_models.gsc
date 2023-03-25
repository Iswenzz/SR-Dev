/*
______           __  _____  _____ 
| ___ \         /  ||  _  ||  _  |
| |_/ /_____  __`| || |/' || |_| |
|    // _ \ \/ / | ||  /| |\____ |
| |\ \  __/>  < _| |\ |_/ /.___/ /
\_| \_\___/_/\_\\___/\___/ \____/ 

*/

//Version 1.0

#include maps\mp\_utility;

initializeModelPickup()
{
    level.modelcount=0;
    
    while(1)
    {
        level waittill("player_spawn", player);
        player.pickup = false;
    }
}

spawnPickuppableModel(origin, angles, model, origin_offset, acceleration_time, radius, height, hintstring, collision_radius, collision_height)
{
    if (!isDefined(origin_offset))
        origin_offset = (0,0,0);

    if (!isDefined(acceleration_time))
        acceleration_time = 0.15;

    if (!isDefined(radius))
        radius = 30;

    if (!isDefined(height))
        height = 30;

    if (!isDefined(hintstring))
        hintstring = "Press ^3[{+activate}] ^7to pickup";

    level.modelcount ++;
    xmodel = spawn( "script_model", origin+origin_offset );
	xmodel.angles = angles;
	xmodel setModel( model );

    trigg = spawn( "trigger_radius", origin, 0, radius, height);

    info = spawnStruct();

    info.xmodel = xmodel;
    info.trigg = trigg;
    info.id = level.modelcount;
    info.origin_offset = origin_offset;
    info.acceleration_time = acceleration_time;
    info.radius = radius;
    info.height = height;
    info.hintstring = hintstring;

    //-----EXPERIMENTAL-----

    if (isDefined(collision_radius)&&isDefined(collision_height))
    {
        solid = spawn( "trigger_radius", origin, 0, collision_radius, collision_height );
        solid.angles = angles;
        solid setContents( 1 );
        info.collisionmodel = solid;
        info.collision_radius = collision_radius;
        info.collision_height = collision_height;
    }

    //-----EXPERIMENTAL-----
    
    thread checkPickup(info);

    return info;
}

destroyPickuppableModel(info)
{
    self notify(info.id+"_mdl");
    info.xmodel delete();
    info.trigg delete();

    if (isDefined(info.collisionmodel))
        info.collisionmodel delete();

    info = undefined;
}

pickUp(info)
{
    self endon(info.id+"button_pressed");

    xmodel = spawn( "script_model", self.origin );
	xmodel setModel( info.xmodel.model );

    cycles = 0;

    while(1)
    {
        trace = bulletTrace(self getPlayerEyePosition(), self getPlayerEyePosition() + vector_scale(anglesToForward(self getPlayerAngles()), 80), false, xmodel);
        xmodel.origin = trace["position"];
        xmodel.angles = self getPlayerAngles();

        if ((self useButtonPressed() && cycles == 5) || !isAlive(self))
        {
            self enableWeapons();
            self.pickup = false;

            xmodel.angles = (0,self.angles[1],0);
            trace = bulletTrace(xmodel.origin+info.origin_offset,xmodel.origin-(0,0,9999999)+info.origin_offset,false,undefined);
            xmodel moveTo(trace["position"]+info.origin_offset, distance((0,0,xmodel.origin[2])+info.origin_offset, (0,0,trace["position"][2]+1))/30*info.acceleration_time, 0, 0);
            xmodel waittill ("movedone");
            xmodel moveTo(xmodel.origin+(0,0,10)+info.origin_offset,0.4,0,0.4);
            xmodel waittill ("movedone");
            xmodel moveTo(trace["position"]+info.origin_offset, 0.4, 0.4, 0);
            xmodel waittill ("movedone");

            spawnPickuppableModel(xmodel.origin-info.origin_offset,xmodel.angles,xmodel.model,info.origin_offset,info.acceleration_time,info.radius,info.height,info.hintstring,info.collision_radius,info.collision_height);

            xmodel delete();

            self notify(info.id+"button_pressed");
        }

        if (cycles!=5)
            cycles++;

        wait 0.001;
    }
}

checkPickup(info)
{
    self endon(info.id+"_mdl");
    while(1)
	{
		info.trigg waittill ( "trigger", player );

        if (!player.pickup)
        {
            if (info.hintstring!="")
                player thread genhud(info.hintstring);

            if (player useButtonPressed())
                {
                    player.pickup = true;
                    player thread pickUp(info);
                    player disableWeapons();
                    thread destroyPickuppableModel(info);
                }
        }
        wait 0.01;
	}
}

getPlayerEyePosition()
{
    if(self getStance() == "prone")
        vector = self.origin + (0, 0, 11);
    else if(self getStance() == "crouch")
        vector = self.origin + (0, 0, 40);
    else
        vector = self.origin + (0, 0, 60);

    return vector;
}

genHud(string)
{
    hud_mdl = newClientHudElem( self );
    hud_mdl setText(string);
    hud_mdl.fontScale = 1.6;
    hud_mdl.x = 0;
    hud_mdl.y = 25;
    hud_mdl.horzAlign = "center";
    hud_mdl.vertAlign = "middle";
    hud_mdl.alignX = "center";
    hud_mdl.alignY = "middle";

    wait 0.1;

    hud_mdl destroy();
}