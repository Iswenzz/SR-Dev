main()
{
	maps\mp\_load::main();		

	precacheItem("rpg_mp");
	precacheItem("m1014_mp");
	precacheItem("ak74u_mp");
	precacheItem("ak47_mp");
	precacheItem("frag_grenade_mp");	

	thread trap1();	
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread room1();
	thread room2();
	thread room3();
	thread teleport();
	thread teleport2();
	thread teleport3();
	thread teleport4();
	thread teleportjj();
	thread teleportja();
	thread sniper();
	thread jump();
	thread knife();
	thread jumperweapon();
	thread secretrpg();
	thread secretrpg2();
	thread actiplatform();
	thread elevator2();
	thread old();
	thread teleportsecret();
	thread teleportb1();
	thread teleportb2();
	thread teleportb3();
	thread teleportb4();
	thread teleportb5();
	thread teleportstrafe();
	thread secretm40a3();
	thread secretak47();
	thread secretm1014();
	thread secretak74u();
	thread welcomemessage();
	thread credits();
	thread secret2rpg();
	thread teleportsecret2();

	addTriggerToList( "room1_trig");
	addTriggerToList( "room2_trig");
	addTriggerToList( "room3_trig");
	addTriggerToList( "trap1_trig");
	addTriggerToList( "trap2_trig");
	addTriggerToList( "trap3_trig");
	addTriggerToList( "trap4_trig");
	addTriggerToList( "trap50_trig");
	addTriggerToList( "trap6_trig");
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

welcomemessage()
{
	wait 8;
	iprintlnbold ("^5Map by ^4Sentrex^5!");
}

credits()
{
	wait 20;
	iprintln ( "^5Scripted by ^4Sentrex^5!" );
	wait 2; 
	iprintln ( "^5With help from ^1Calum, Bumba and Phelix^5!" );
	wait 10;
	iprintln ( "^3Thank you to everyone in the Blur/Deathrun community!" );
	wait 20;
	iprintln ( "^2Thank you to the almighty ^6Kieran^2, the spark to Sentrex's brain!" );
	wait 10;
	iprintln ( "Map testers - Cloudy, Agony, Pikachu, Luke and ^5Twix-TheProGlitcher^7!" );
	wait 10;
	iprintln ( "Awesome people - Tail_TL, Cloudy/Matt, ^4BlueSeven the NubCake^7, ^6Sox<3fpsGirl^7!" );		
}



jumperweapon()
{
    trig = getEnt ("trigger_jumpweapon" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m40a3_mp" );
        player giveMaxAmmo( "m40a3_mp" );
        player switchToWeapon( "m40a3_mp" );
	player iprintlnbold ("Remember, you're ^4 NOT ^7 a noob for shooting!");  
    } 	
}


actiplatform()

{
	brush = getEnt ("actiplatform", "targetname");
    	trig = getEnt ("actiplatform_trig", "targetname");
 
    	trig waittill("trigger", user);
    	trig delete();
	brush moveZ(272, 2);
	
 
}

elevator2()

{
	brush = getEnt ("elevator2", "targetname");
	
	while(1)
{	
	brush moveZ(192, 2);
	wait 2;
	brush moveZ(-192, 2);
	wait 2;
}	
	
 
}

teleport()

{
	trig = getEnt ("teleport_trigger", "targetname");
	target = getEnt ("teleport_target", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport2()

{
	trig = getEnt ("teleport_trigger2", "targetname");
	target = getEnt ("teleport_target2", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleport3()

{
	trig = getEnt ("teleport_trigger3", "targetname");
	target = getEnt ("teleport_target3", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}


teleportjj()

{
	trig = getEnt ("teleport_triggerj_jumper", "targetname");
	target = getEnt ("teleport_targetj_jumper", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleportja()

{
	trig = getEnt ("teleport_triggerj_acti", "targetname");
	target = getEnt ("teleport_targetj_acti", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

///////////////////////////////////////////////////////////////////////////////

room1()
{
   	brush = getEnt ("room1", "targetname"); 
    	trig = getEnt ("room1_trig", "targetname"); 
    
	trig waittill("trigger", who);
    	trig delete();
	
	while(1)
{    
    	brush rotateYaw(-360,4);
	wait 2; 
}

}

room2()
{
   	brush = getEnt ("room2", "targetname"); 
    	trig = getEnt ("room2_trig", "targetname"); 
    
	trig waittill("trigger", who);
    	trig delete();
	
	while(1)
{    
    	brush rotateYaw(-360,2);
	wait 2; 
}

}

room3()
{
	brush = getEnt ("room3", "targetname");
    	trig = getEnt ("room3_trig", "targetname");
 
    	trig waittill("trigger", user);
    	trig delete();
	
	while(1)
{
	brush moveZ(50, 0.5);
	wait 0.5;
	brush moveZ(-50, 0.5);
	wait 0.5;	 
}

}

trap1()
{
   	brush = getEnt ("trap1", "targetname"); 
    	trig = getEnt ("trap1_trig", "targetname"); 
    
	trig waittill("trigger", who);
    	trig delete();
	
	while(1)
{    
    	brush rotateYaw(-360,2);
	wait 2; 
}

}

trap2()
{
	brush1 = getEnt ("trap2", "targetname");
	brush2 = getEnt ("trap2b", "targetname");
    	trig = getEnt ("trap2_trig", "targetname");
 
    	trig waittill("trigger", user);
    	trig delete();
	brush1 moveZ(448, 0.5);
	wait 10; 
	brush1 delete();
	
	while(1)
{
	brush2 moveX(150, 2);
	wait 2;
	brush2 moveX(-150, 2);
	wait 5;

		
}

 
}

trap3()
{
	brush = getEnt ("trap3", "targetname"); 
    	trig = getEnt ("trap3_trig", "targetname"); 
    
	trig waittill("trigger", who);
    	trig delete();
	
	while(1)
{
    
    	brush rotateroll(-360,1.5);
	wait 1.5;
}
	
}

trap4()
{
 brush = getEnt ("trap4", "targetname");
 trig = getEnt ("trap4_trig", "targetname");

 trig waittill("trigger", who);
     trig delete();
     brush delete();
}

trap5()
{
   	brush = getEnt ("trap50", "targetname"); 
    	trig = getEnt ("trap50_trig", "targetname"); 
    
	trig waittill("trigger", who);
    	trig delete();
	
	while(1)
{    
    	brush rotateYaw(-360,3);
	wait 3; 
}

}

trap6()
{
 brush = getEnt ("trap6", "targetname");
 trig = getEnt ("trap6_trig", "targetname");

 trig waittill("trigger", who);
     trig delete();
     brush delete();
}

//////////////////////////////////////////////////////////////////////////////////////////


sniper()
{
    level.snipe_trig = getEnt( "trigger_sniper", "targetname"); //Your trigger that you made obviously..
    jump = getEnt( "sniper_jumper", "targetname" ); //Jumper Origin
    acti = getEnt( "sniper_acti", "targetname" ); //Activator Origin
    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
            
        level.jump_trig delete();
	level.knife_trig delete();
	level.old_trig delete();


        player setPlayerAngles( jump.angles ); //sets the angles of the origin
        player setOrigin( jump.origin ); //sets the origin 
        player setMoveSpeedScale( 1 ); //sets normal speed
        player takeAllWeapons(); //takes all the players weapons
        player giveWeapon( "m40a3_mp" ); //gives m40a3
        player giveMaxAmmo( "m40a3_mp" ); //max m40a3 ammo
        level.activ setPlayerAngles( acti.angles ); //sets the angles of the origin
        level.activ setOrigin( acti.origin ); //sets the origin
        level.activ setMoveSpeedScale( 1 ); //sets normal speed
        level.activ takeAllWeapons(); //takes all weapon
        level.activ giveWeapon( "m40a3_mp" ); //gives m40a3
        level.activ giveMaxAmmo( "m40a3_mp" ); //max m40a3 ammo for acti
        wait 0.05; //waits a time limit
        player switchToWeapon( "m40a3_mp" ); //switches jumper to m40a3
        level.activ switchToWeapon( "m40a3_mp" ); //switches acti to m40a3
        iPrintlnBold( " ^6" + player.name + " ^7has chosen ^6SNIPER^7 room^6!" ); //lets players know who entered the room (player.name is the person who triggered it.) (EXAMPLE: Zack entered the Sniper Room!        
        while( isAlive( player ) && isDefined( player ) )
        wait 1;
    }
}

jump()
{
level.jump_trig = getEnt( "trigger_jump", "targetname");
jump = getEnt( "jump_jumper", "targetname" );
acti = getEnt( "jump_acti", "targetname" );

while(1)
{
level.jump_trig waittill( "trigger", player );
if( !isDefined( level.jump_trig ) )
return;

level.snipe_trig delete();
level.knife_trig delete();
level.old_trig delete();

player setPlayerAngles( jump.angles );
player setOrigin( jump.origin );
player setMoveSpeedScale( 1 );
player takeAllWeapons();
player giveWeapon( "knife_mp");	
level.activ setPlayerAngles( acti.angles );
level.activ setOrigin( acti.origin );
level.activ setMoveSpeedScale( 1 );
level.activ takeAllWeapons();
level.activ giveWeapon( "knife_mp");
wait 0.05;
player switchToWeapon( "knife_mp" );
level.activ switchToWeapon( "knife_mp" );
iPrintlnBold( " ^6" + player.name + " ^7has chosen ^6JUMP^7 room^6!" );	
while( isAlive( player ) && isDefined( player ) )
wait 1;
}
}

knife()
{
    level.knife_trig = getEnt( "trigger_knife", "targetname"); //Your trigger that you made obviously..
    jump = getEnt( "knife_jumper", "targetname" ); //Jumper Origin
    acti = getEnt( "knife_acti", "targetname" ); //Activator Origin
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
            
        level.snipe_trig delete();
	level.jump_trig delete();
	level.old_trig delete();

        player setPlayerAngles( jump.angles ); //sets the angles of the origin
        player setOrigin( jump.origin ); //sets the origin 
        player setMoveSpeedScale( 1 ); //sets normal speed
        player takeAllWeapons(); //takes all the players weapons
        player giveWeapon( "knife_mp" ); //gives m40a3       
        level.activ setPlayerAngles( acti.angles ); //sets the angles of the origin
        level.activ setOrigin( acti.origin ); //sets the origin
        level.activ setMoveSpeedScale( 1 ); //sets normal speed
        level.activ takeAllWeapons(); //takes all weapon
        level.activ giveWeapon( "knife_mp" ); //gives m40a3
        wait 0.05; //waits a time limit
        player switchToWeapon( "knife_mp" ); //switches jumper to m40a3
        level.activ switchToWeapon( "knife_mp" ); //switches acti to m40a3
        iPrintlnBold( " ^6" + player.name + " ^7has chosen ^6KNIFE^7 room^6!" ); //lets players know who entered the room (player.name is the person who triggered it.) (EXAMPLE: Zack entered the Sniper Room!        
        while( isAlive( player ) && isDefined( player ) )
        wait 1;
    }
}

old()
{
    level.old_trig = getEnt( "trigger_old", "targetname"); //Your trigger that you made obviously..
    acti = getEnt( "old_acti", "targetname" ); //Activator Origin
    brush = getEnt ("old", "targetname");

	level.old_trig waittill("trigger", user);
    	level.old_trig delete();
	brush moveZ(240, 0.5);    

	while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.old_trig ) )
            return;
            
        level.snipe_trig delete();
	level.jump_trig delete();
	level.knife_trig delete();

        player setMoveSpeedScale( 1 ); //sets normal speed       
        level.activ setPlayerAngles( acti.angles ); //sets the angles of the origin
        level.activ setOrigin( acti.origin ); //sets the origin
        level.activ setMoveSpeedScale( 1 ); //sets normal speed
        wait 0.05; //waits a time limit
        iPrintlnBold( " ^6" + player.name + " ^7has chosen the ^6OLD^7 way^6!" ); //lets players know who entered the room (player.name is the person who triggered it.) (EXAMPLE: Zack entered the Sniper Room!        
        wait 1;
    }
}

//////////////////////////////////////////////////////////////////////////////////


teleportsecret()

{
	trig = getEnt ("teleport_trigger_secret", "targetname");
	target = getEnt ("teleport_target_secret", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
	
	iprintlnbold ( " ^6" + player.name + " ^7has found the ^6SECRET^7!" );	
	player iprintlnbold ("Woah! Good luck!");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}


teleportb1()

{
	trig = getEnt ("teleport_trigger_b1", "targetname");
	target = getEnt ("teleport_target_b1", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleportb2()

{
	trig = getEnt ("teleport_trigger_b2", "targetname");
	target = getEnt ("teleport_target_b2", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleportb3()

{
	trig = getEnt ("teleport_trigger_b3", "targetname");
	target = getEnt ("teleport_target_b3", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleportstrafe()

{
	trig = getEnt ("teleport_trigger_strafe", "targetname");
	target = getEnt ("teleport_target_strafe", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleportb4()

{
	trig = getEnt ("teleport_trigger_b4", "targetname");
	target = getEnt ("teleport_target_b4", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}

teleportb5()

{
	trig = getEnt ("teleport_trigger_b5", "targetname");
	target = getEnt ("teleport_target_b5", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	//player iprintlnbold ("You have been teleported");
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}


secretrpg()
{
    trig = getEnt ("trigger_secretrpg" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "rpg_mp" );
        player giveMaxAmmo( "rpg_mp" );
        player switchToWeapon( "rpg_mp" );
    } 	
}

secretrpg2()
{
    trig = getEnt ("trigger_secretrpg2" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "rpg_mp" );
        player giveMaxAmmo( "rpg_mp" );
        player switchToWeapon( "rpg_mp" );
    } 	
}




teleport4()

{
	trig = getEnt ("teleport_trigger4", "targetname");
	target = getEnt ("teleport_target4", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	iprintlnbold ( " ^6" + player.name + " ^7has completed the ^6SECRET^7!" );
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}

}
//////////////////////////////////////////////////////////////////////////////////////

secretm40a3()
{
    trig = getEnt ("trigger_secretm40a3" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m40a3_mp" );
        player giveMaxAmmo( "m40a3_mp" );
        player switchToWeapon( "m40a3_mp" );
	 
    } 	
}

secretak74u()
{
    trig = getEnt ("trigger_secretak74u" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "ak74u_mp" );
        player giveMaxAmmo( "ak74u_mp" );
        player switchToWeapon( "ak74u_mp" );
	
    } 	
}

secretm1014()
{
    trig = getEnt ("trigger_secretm1014" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "m1014_mp" );
        player giveMaxAmmo( "m1014_mp" );
        player switchToWeapon( "m1014_mp" );
	
    } 	
}

secretak47()
{
    trig = getEnt ("trigger_secretak47" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "ak47_mp" );
        player giveMaxAmmo( "ak47_mp" );
        player switchToWeapon( "ak47_mp" );
	
    } 	
}

secret2rpg()
{
    trig = getEnt ("secret2rpg" , "targetname");
    
    while(1)
    {
        trig waittill("trigger", player);
        
	player giveWeapon( "rpg_mp" );
        player giveMaxAmmo( "rpg_mp" );
        player switchToWeapon( "rpg_mp" );
	//player iprintlnbold ( " I wonder what you need this for?... " ) 
    } 	
}

teleportsecret2()

{
	trig = getEnt ("teleportsecret2_trigger", "targetname");
	target = getEnt ("teleportsecret2_target", "targetname");
	
	for(;;)
{
	trig waittill ("trigger", player);
		
	iprintlnbold ( " ^6" + player.name + " ^7has completed the ^6SECOND SECRET^7!" );
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	player giveWeapon( "frag_grenade_mp" );
        player giveMaxAmmo( "frag_grenade_mp" );
        player switchToWeapon( "frag_grenade_mp" );
}

}