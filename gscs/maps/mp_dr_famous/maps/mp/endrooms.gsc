/*

	Map by NitroFire
	[If you plan to use these scripts, make sure to give credit where it is due.]

*/
main()
{
  thread sniperroom();
  thread jumproom();
  thread jumpweapon();
}

sniperroom()
{
 
    level.final_sniper_trig = getEnt( "enter5", "targetname");
    jump = getEnt( "sniper1", "targetname" );
    acti = getEnt( "sniper2", "targetname" );
   
 
     while(1)
    {
        level.final_sniper_trig waittill( "trigger", player );
        if( !isDefined( level.final_sniper_trig ) )
            return;
       
        level.final_jump_trig delete();

         player.health = player.maxhealth;
         level.activ.health = level.activ.maxhealth;
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
        player GiveWeapon( "m40a3_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );        
        wait 0.05;
        player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
                noti.titleText = "Sniper Room";
                noti.notifyText = "^1" + level.activ.name + " ^3VS^1 " + player.name;
                noti.glowcolor = (1,0,0.9);
                noti.duration = 5;
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                wait 5;
                player FreezeControls(0);
                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
           
    }
 
}

jumproom()
{
 
    level.final_jump_trig = getEnt( "enter6", "targetname");
    jump = getEnt( "jump1", "targetname" );
    acti = getEnt( "jump2", "targetname" );
 
     while(1)
    {
        level.final_jump_trig waittill( "trigger", player );
        if( !isDefined( level.final_jump_trig ) )
            return;
       
        level.final_sniper_trig delete();

         player.health = player.maxhealth;
         level.activ.health = level.activ.maxhealth;
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );     
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
                noti.titleText = "Jump Room";
                noti.notifyText = "^1" + level.activ.name + " ^3VS^1 " + player.name;
                noti.glowcolor = (1,0,0.9);
                noti.duration = 5;
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                wait 5;
                player FreezeControls(0);
                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
           
    }
 
}
   
jumpweapon()
{
    trig = getEnt("jumpweapon","targetname");

    for(;;)
    {
        trig waittill("trigger", who);
        who giveWeapon("m40a3_mp");
        who giveweapon("remington700_mp");
        who giveMaxAmmo("m40a3_mp");
        who givemaxammo("remington700_mp");
        who switchToWeapon("m40a3_mp");
    }

}