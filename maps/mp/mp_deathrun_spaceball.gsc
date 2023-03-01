main()
{
maps\mp\_load::main();
// ambientPlay("fullmap");

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 //now if you want you can try the map, i will make another tut to add endmap trig if there isnt already on the map.
 //once you tested it and everything work, there is a final thing to add, once u added it you cant test the map again and u should give the gsc

 thread way_connect(); // put it as the 1st thread

 thread teleport1(); //now lets check each function
 thread teleport2();
 thread teleport3();
 thread teleport4();
 thread teleport5();
 thread teleport6(); // so in one of these teleport there is the secret, but tbh there is no way i'll find it by just reading the script.
 thread teleport7(); // so we need to test in game.
 thread teleport8();
 thread teleport9();
 thread teleport10();
 thread start();

 thread creator();
 thread move11();

 thread trap1(); // lets disable the trap first.
 thread trap2(); // traps are done
 thread trap3();
 thread trap4();
 thread trap5();
 thread trap6();
 thread trap7();

 thread finalFight1(); // all this can be disabled its the endroom
 // thread finalFight2();
 // thread finalFight3();
 // thread finalFight4();
 // thread moveknife();
 // thread teleportacti();
 // thread teleportacti2();
 // thread teleportacti3(); // teleport acti is useless
 thread ballrotate1(); // ball rotate is just some ball at the start of the map, u can keep it 
 thread ballrotate2();
 thread ballrotate3();
 thread ballrotate4();
 thread secretroom();

preCacheItem( "winchester1200_mp" );
preCacheItem( "mp5_mp" );


}

////////////////////////////////////////////////////////////////////////////////////////////////
way_connect()
{
    wait 0.05; // then copy the function under main function 
  
    speedrun\_way_name::createWay("normal", "Normal Way", "1");
  speedrun\_way_name::createWay("secret", "Secret Way", "1"); // if there isnt a secret way just delete this line. tut done kek 
  // also if the secret doesnt have ANY teleporter, i will make a tut about it, also there is some map that use teleporter array so ye i need to make 3 other tuts, but most map will work with that
  
    for(;;) 
    {
        level waittill( "connected", player );
        player thread speedrun\_way_name::way_name();
    }
}
////////////////////////////////////////////////////////////////////////////////////////////////


addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

teleport1()
{
  trig = getEnt( "spawn", "targetname"); 
  target = getEnt( "spawned", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleport2()
{
  trig = getEnt( "lifespawn", "targetname"); 
  target = getEnt( "lifespawned", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleport3()
{
  trig = getEnt( "act2", "targetname"); 
  target = getEnt( "acti2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleport4()
{
  trig = getEnt( "act3", "targetname"); 
  target = getEnt( "acti3", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}
teleport5()
{
  trig = getEnt( "act4", "targetname"); 
  target = getEnt( "acti4", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleport6()
{
  trig = getEnt( "rpgback1", "targetname"); 
  target = getEnt( "rpgbacked1", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleport7()
{
  trig = getEnt( "rpgback2", "targetname"); 
  target = getEnt( "rpgbacked2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleport8()
{
  trig = getEnt( "secretenter", "targetname"); // well thanks to madlion who coded it like that lmao, but i will still show how to find it if there is no hint like this one
  target = getEnt( "secretentered", "targetname"); // so basicaly just put an iprintlnbold on all of them, all tps and u'll know which one is the one u want

  for(;;)
  {
     trig waittill ("trigger", player); // now we need to add the secret trigger for sr speedrun
     player speedrun\_way_name::startSecret(); //Speedrun Copy Paste this line will start the secret also make sure it use the right ent name 
     player SetOrigin(target.origin); // i use this txt where i have everything needed to add map on sr speedrun
     player SetPlayerAngles( target.angles ); // if when u end the secret the end of the map is still far, you can end the timer when people finish the secret
      }
}

teleport9()
{
  trig = getEnt( "secretback", "targetname"); 
  target = getEnt( "secretbacked", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
     }
}

teleport10()
{
  trig = getEnt( "secretfinish", "targetname"); 
  target = getEnt( "secretfinished", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); //this one is the tp at the end

     if(isDefined(player.sr_secret) && player.sr_secret) // this will end the timer only for people in secret
       player thread braxi\_mod::endTimer();
  }
}

start()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^5SPACEBALL" ); // credtis, we can keep it, except if its on a loop its kinda boring if you see the credits on a while/for loop just remove the loop.
wait(4);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^4Map by ^5Madlion ^4xFire: ^5madlion3" );
wait(4);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^5Let's go" );
}

creator()
{
while( 1 ) // lets keep that i guess, some credits every 60s 180 better ))
{
iPrintLn( "^5Map made by ^4MadLion ^5xfire: ^4madlion3");
wait 180;
}
}

move11()
{
 
move11 = getEnt( "move11", "targetname" );
 
 
{ // this is the plat at spawn, eh idk, kinda weird map to add to sr speedrun, i think i'll just delete this plat and move the spawn somewhere
 // to remove this plat just delete it like that and remove the delay i want it to be instant deleted
move11 delete();

}
}


move2()
{
 
move2 = getEnt( "move2", "targetname" );
 
 
{
wait 13;
move2 movex( 4700, 5 );
wait 5;
move2 movez( 150, 2 );

}
}

trap1()
{
 
trig = getEnt( "trap1trig", "targetname" );
rotate1 = getEnt( "trap1", "targetname" );
rotate2 = getEnt( "trap11", "targetname" );
rotate3 = getEnt( "trap111", "targetname" );
 
trig waittill ("trigger"); // you need to delete everything bellow this kind of line "waittill trigger"
// some maps have some script before they waittill trigger, dont remove that.

}

trap2()
{
 
trig = getEnt( "trap2trig", "targetname" );
left = getEnt( "trap2", "targetname" );
right = getEnt( "trap22", "targetname" );
 
trig waittill ("trigger");
}

trap3()
{
 
trig = getEnt( "trap3trig", "targetname" );
rotate = getEnt( "trap3", "targetname" );
 
trig waittill ("trigger");

}

trap4()
{
 
trig = getEnt( "trap4trig", "targetname" );
ham1 = getEnt( "trap4", "targetname" );
ham2 = getEnt( "trap44", "targetname" );
 
trig waittill ("trigger");

}

trap5()
{
 
trig = getEnt( "trap5trig", "targetname" );
hamm1 = getEnt( "trap5", "targetname" );
hamm2 = getEnt( "trap55", "targetname" );
hamm3 = getEnt( "trap555", "targetname" );
 
trig waittill ("trigger");

}

trap6()
{
 
trig = getEnt( "trap6trig", "targetname" );
hammm1 = getEnt( "trap6", "targetname" );
 
trig waittill ("trigger");

}


trap7()
{
 
trig = getEnt( "trap7trig", "targetname" );
hammmm1 = getEnt( "trap7", "targetname" );
 
trig waittill ("trigger");

}


old()
{
 
oldmove = getEnt( "oldmove", "targetname" );
 
 
{

oldmove movez( -10, 1 );
wait 1;

}
}

finalFight1()
{
    trig = getEnt( "kniferoom", "targetname" );
    tele_activator = getEnt( "knife_activator", "targetname" );
    tele_jumper = getEnt( "knife_jumper", "targetname" );
                
    level.finalJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );
if(!plugins\_respect::roomCheck(player)) // these line
            continue; // these line
        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
        
        level.finalJumper finalRoom( tele_jumper, "knife_mp", 100 );
        iPrintLnBold(player.name+ "^4 has entered the ^2Knife Room");
        level.activ finalRoom( tele_activator, "knife_mp", 100 );

    }
    // code never gets here
}


finalFight2()
{
    trig = getEnt( "rpgroom", "targetname" );
    tele_activator = getEnt( "rpg_activator", "targetname" );
    tele_jumper = getEnt( "rpg_jumper", "targetname" );
                
    level.finalJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );

        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
        
        level.finalJumper finalRoom( tele_jumper, "winchester1200_mp", 100 );
        iPrintLnBold(player.name+ "^4 has entered the ^2Shotgun Room");
        level.activ finalRoom( tele_activator, "winchester1200_mp", 100 );

    }
    // code never gets here
}

finalFight3()
{
    trig = getEnt( "sniperroom", "targetname" );
    tele_activator = getEnt( "snip_activator", "targetname" );
    tele_jumper = getEnt( "snip_jumper", "targetname" );
                
    level.finalJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );

        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
        
        level.finalJumper finalRoom( tele_jumper, "m40a3_mp", 100 );
        iPrintLnBold(player.name+ "^4 has entered the ^2Sniper Room");
        level.activ finalRoom( tele_activator, "m40a3_mp", 100 );

    }
    // code never gets here
}

finalFight4()
{
    trig = getEnt( "jumproom", "targetname" );
    tele_activator = getEnt( "jump_activator", "targetname" );
    tele_jumper = getEnt( "jump_jumper", "targetname" );
                
    level.finalJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );

        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
        
        level.finalJumper finalRoom( tele_jumper, "mp5_mp", 100 );
        iPrintLnBold(player.name+ "^4 has entered the ^2Crazy Weapon Room");
        level.activ finalRoom( tele_activator, "mp5_mp", 100 );

    }
    // code never gets here
}

finalFight5()
{
    trig = getEnt( "oldroom", "targetname" );
    tele_activator = getEnt( "oldactivator", "targetname" );
    tele_jumper = getEnt( "oldjumper", "targetname" );
                
    level.finalJumper = undefined;

    while( 1 )
    {
        trig waittill( "trigger", player );
   
        if (player.pers["team"] != "allies" ) 
        continue;

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
        
        level.finalJumper finalRoom1( tele_jumper, "tomahawk_mp", 100 );
        iPrintLnBold(player.name+ "^4 has entered the ^2OLD Room");
        level.activ finalRoom( tele_activator, "tomahawk_mp", 100 );

    }
    // code never gets here
}

finalMonitor()
{
    self endon( "disconnect" );
    self thread monitorDisconnect();

    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}

monitorDisconnect()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}

finalRoom( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );

}

finalRoom1( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );

}

partymode()
{
	for(;;)
	{	
		SetExpFog(256, 900, 1, 0, 0, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0, 1, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 1, 0.1); 
		wait .5; 
        SetExpFog(256, 900, 0.4, 1, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.8, 0, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.2, 1, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 0.4, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 0.2, 0.2, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 1, 1, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.6, 0, 0.4, 0.1); 
       wait .5; 
        SetExpFog(256, 900, 1, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.6, 1, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 0, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 1, 0, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0, 0, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.4, 1, 0.8, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.8, 0, 0.6, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0.6, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 1, 1, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.2, 1, 0.8, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.4, 0.4, 1, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0, 0, 0, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.4, 0.2, 0.2, 0.1); 
       wait .5; 
        SetExpFog(256, 900, 0.4, 1, 1, 0.1); 
        wait .5; 
        SetExpFog(256, 900, 0.6, 0, 0.4, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 0, 0.8, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 1, 1, 0, 0.1); 
         wait .5; 
        SetExpFog(256, 900, 0.6, 1, 0.6, 0.1); 
	}
}

moveknife()
{
 
moveknife = getEnt( "knifemove", "targetname" );
 
 
{
wait 1; // no idea wuts dis, disable it :shrug:
moveknife rotateroll( 180, 1 );

}
}

teleportacti()
{
  trig = getEnt( "actback2", "targetname"); 
  target = getEnt( "actbacked", "targetname");


  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleportacti2()
{
  trig = getEnt( "actback3", "targetname"); 
  target = getEnt( "actbacked3", "targetname");


  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleportacti3()
{
  trig = getEnt( "actback5", "targetname"); 
  target = getEnt( "actbacked5", "targetname");


  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
      }
}

teleportold()
{
  trig = getEnt( "oldenter", "targetname"); 
  target = getEnt( "oldentered", "targetname");


  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
     iPrintLnBold(player.name+ "^4 has entered the ^2OLD Room");
      }
}

ballrotate1()
{
 
ballrotate1 = getEnt( "rotateball1", "targetname" );

 
while( 1 )
{

ballrotate1 rotateyaw( 360, 2 );
wait 2;

}
}

ballrotate2()
{
 
ballrotate2 = getEnt( "rotateball2", "targetname" );

 
while( 1 )
{

ballrotate2 rotateyaw( 360, 2 );
wait 2;

}
}

ballrotate3()
{
 
ballrotate3 = getEnt( "rotateball3", "targetname" );

 
while( 1 )
{

ballrotate3 rotateyaw( 360, 2 );
wait 2;

}
}

ballrotate4()
{
 
ballrotate4 = getEnt( "rotateball4", "targetname" );

 
while( 1 )
{

ballrotate4 rotateyaw( 360, 4 );
wait 4;

}
}

secretroom()
{
 
trig = getEnt( "secretdoortrig", "targetname" );
secretdoor = getEnt( "secretdoor", "targetname" );
 
trig delete();

secretdoor delete(); // secret door is deleted so anyone can enter it without steps
// also i need all music to be disabled so search for keyword 
// ambientPlay
// playlocalsound
// and remove all of them
// done


}

 
new_ending_hud( align, fade_in_time, x_off, y_off )
{
        hud = newClientHudElem( self );
        hud.foreground = true;
        hud.x = x_off;
        hud.y = y_off;
        hud.alignX = align;
        hud.alignY = "middle";
        hud.horzAlign = align;
        hud.vertAlign = "middle";
 
        hud.fontScale = 1.6;
 
        hud.color = (1, 1, 1);
        hud.font = "objective";
        hud.glowColor = (0.8, 0.3, 0.8);
        hud.glowAlpha = 0.5;
 
        hud.alpha = 1;
        hud fadeovertime( fade_in_time );
        hud.alpha = 1;
        hud.hidewheninmenu = true;
        hud.sort = 10;
        return hud;
}
 
drawInformationUp( start_offset, movetime, mult, text )
{
        start_offset *= mult;
        hud = new_ending_hud( "center", 0.1, start_offset, -15 );
        hud setText( text );
        hud moveOverTime( movetime );
        hud.x = -100;
        wait( movetime );
        hud moveOverTime( 5 );
        hud.x = 100;
        wait 5;
        hud moveOverTime( movetime );
        hud.x = start_offset * -1;
 
        wait movetime;
        hud destroy();
}
 
drawInformationDown( start_offset, movetime, mult, text )
{
        start_offset *= mult;
        hud = new_ending_hud( "center", 0.1, start_offset, 15 );
        hud setText( text );
        hud moveOverTime( movetime );
        hud.x = 100;
        wait( movetime );
        hud moveOverTime( 5 );
        hud.x = -100;
        wait 5;
        hud moveOverTime( movetime );
        hud.x = start_offset * -1;
 
        wait movetime;
        hud destroy();
}