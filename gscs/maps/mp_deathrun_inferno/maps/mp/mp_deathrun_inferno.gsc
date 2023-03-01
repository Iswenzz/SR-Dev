/*                                         ╔═╗
	   ╔═════╗ ╔══════╗ ╔═════╗ ╔═╗ ╔═╗ ╔══╝ ╚═╗ ╔══════╗ ╔═╗  ╔═╗ ╔═╗
	   ╚╣ ╔╗ ║ ║  ╔═╗ ║ ║ ╔╗  ║ ║ ║ ║ ║ ║ ╔════╝ ║ ╔══╗ ║ ║ ║  ║ ║ ║ ║
		║ ║║ ║ ║  ╚═╝ ║ ║ ╚╝  ║ ║ ╚═╝/╝ ║ ╚════╗ ║ ║  ║ ║ ║ ║  ║ ║ ║ ║
		║ ║║ ║ ║ ╔══╗ ║ ║ ╔═ ║  ║ ╔═╗\  ╚════╗ ║ ║ ║  ║ ║ ║ ║  ║ ║ ║ ║
	   ╔╣ ╚╝ ║ ║ ║  ║ ║ ║ ║ ║ ║ ║ ║ ║ ║ ╔════╝ ║ ║ ╚══╝ ║ ║ ╚══╝ ║ ║ ╚════╗
	   ╚═════╝ ╚═╝  ╚═╝ ╚═╝ ╚═╝ ╚═╝ ╚═╝ ╚══╗ ╔═╝ ╚══════╝ ╚══════╝ ╚══════╝
                                           ╚═╝
	[If you use these scripts, make sure to give me credit pl0x. k thx. bai.]
*/
main()
{
	level.mortar = loadFX("explosions/artilleryExp_dirt_brown_low");
	level.rainbowfire = loadFX("deathrun/rainbowfire");
	level.fire1 = loadFX("deathrun/fire1");
	
	precacheItem("p90_reflex_mp");
	precacheItem("ak47_mp");
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("p90_mp");
	precacheItem("rpg_mp");
	
	maps\mp\_load::main();
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	game["menu_inferno"] = "inferno";
	
	precacheMenu(game["menu_inferno"]);
	
	//precacheMenu( "inferno" );
	
	playLoopedFX(level.rainbowfire, 0.05, (-1248, 1948, 316));
	playLoopedFX(level.rainbowfire, 0.05, (-1248, 1380, 316));
	playLoopedFX(level.fire1, 0.05, (104, 1472, 412));
	playLoopedFX(level.fire1, 0.05, (104, 1872, 412));
	
	setDvar("r_drawDecals", "1");
	setDvar("fx_enable", "1");
	
	thread Traps();
	thread OtherShit();
	thread Rooms();
	//thread Escalator();
}
Traps()
{
	thread Trap1();
	thread Trap2_1();
	thread Trap2_2();
	thread Trap3();
	thread Trap4();
	thread Trap5();
	thread Trap6();
	thread Trap7();
	thread Trap8();
	thread Trap9();
	thread Trap10();
	thread Trap11();
	thread Trap12();
	thread Trap13();
	thread Trap14();
	thread Trap15();
}
Trap1()
{
	trig = getEnt("trigger_trap1","targetname");
 	brush = getEnt("trap1","targetname");

	trig waittill("trigger", player);
	
	trig delete();
	
	brush moveZ(8, 2);
}
Trap2_1()
{
	trig = getEnt("trigger_trap2","targetname");
 	brush1 = getEnt("trap2_1","targetname");
	brush2 = getEnt("trap2_2","targetname");
	brush3 = getEnt("trap2_3","targetname");
	brush4 = getEnt("trap2_4","targetname");
	brush5 = getEnt("trap2_5","targetname");
	brush6 = getEnt("trap2_6","targetname");
	brush7 = getEnt("trap2_7","targetname");
	brush8 = getEnt("trap2_8","targetname");
	brush9 = getEnt("trap2_9","targetname");
	brush10 = getEnt("trap2_10","targetname");

	trig waittill("trigger", player);
	
	trig delete();
	
	while(1)
	{
		brush1 rotateYaw( 360, 1 );
		brush3 rotateYaw( 360, 1 );
		brush5 rotateYaw( 360, 1 );
		brush7 rotateYaw( 360, 1 );
		brush9 rotateYaw( 360, 1 );
		wait randomIntRange(1, 3);
		brush2 rotateYaw( 360, 1 );
		brush4 rotateYaw( 360, 1 );
		brush6 rotateYaw( 360, 1 );
		brush8 rotateYaw( 360, 1 );
		brush10 rotateYaw( 360, 1 );
		wait randomIntRange(1, 3);
	}
}
Trap2_2()
{
	trig = getEnt("trigger_trap2","targetname");
	trap2_11 = getEnt("trap2_11","targetname");
	trap2_12 = getEnt("trap2_12","targetname");
	
	trig waittill("trigger", player);
       
	trig delete();
    
	while(1)
	{
		wait randomIntRange(1, 3);
		trap2_11 moveX(-608, 1.5);
		trap2_11 waittill("movedone");
		wait randomIntRange(1, 3);
		trap2_11 moveX(608, 1.5);
		trap2_11 waittill("movedone");
		wait randomIntRange(1, 3);
		trap2_12 moveX(-608, 1.5);
		trap2_12 waittill("movedone");
		wait randomIntRange(1, 3);
		trap2_12 moveX(608, 1.5);
		trap2_12 waittill("movedone");
	}	
}
Trap3()
{
	trig = getEnt("trigger_trap3","targetname");
 	brush1 = getEnt("trap3_1","targetname");
	brush2 = getEnt("trap3_2","targetname");
	brush3 = getEnt("trap3_3","targetname");

	trig waittill("trigger", player);
	
	trig delete();
	
	brush1 moveZ (-168, 3);
	brush2 moveZ (-168, 3);
	playFx( level.mortar, brush3.origin); 
	earthquake( 1, 1, brush3.origin, 500 );
	brush3 delete();
	brush3 notSolid();
	brush3 hide();
	brush3 playSound("exp_suitcase_bomb_stereo");
	wait 3;
	brush1 moveZ (168, 3);
	brush2 moveZ (168, 3);
}
Trap4()
{
	trig = getEnt("trigger_trap4","targetname");
 	brush = getEnt("trap4","targetname");
	
	trig waittill("trigger", player);
	
	trig delete();
	
	while(1)
	{
		brush moveX (200, 3);
		wait 2;
		brush moveX (-200, 3);
		wait 2;
	}
}
Trap5()
{
	trig = getEnt("trigger_trap5","targetname");
 	brush = getEnt("trap5","targetname");
	
	trig waittill("trigger", player);
	
	trig delete();
	
	while(1)
	{
		wait 0.01;
		brush rotatePitch (-360, 3);
	}
}
Trap6()
{
	trig = getEnt("trigger_trap6","targetname");
 	brush = getEnt("trap6","targetname");

	trig waittill("trigger", player);

	trig delete();

	brush moveZ (-250, 4);
	brush waittill ("movedone");
	wait 1;
	brush moveZ (250, 5);
}
Trap7()
{
	trig = getEnt ("trigger_trap7", "targetname");
	
	trig waittill ("trigger", player);
	
	trig delete();
	
	thread minefunc( "trap7_mine1trig", "trap7_mine1");
	thread minefunc( "trap7_mine2trig", "trap7_mine2");
	thread minefunc( "trap7_mine3trig", "trap7_mine3");
	thread minefunc( "trap7_mine4trig", "trap7_mine4");
	thread minefunc( "trap7_mine5trig", "trap7_mine5");
	thread minefunc( "trap7_mine6trig", "trap7_mine6");
	thread minefunc( "trap7_mine7trig", "trap7_mine7");
	thread minefunc( "trap7_mine8trig", "trap7_mine8");
}
minefunc( trigger, mine )
{
	trig = getEnt ( trigger, "targetname");
	mine = getEnt ( mine, "targetname");
	
	trig waittill ("trigger", player);
	trig delete();
	playFx( level.mortar, mine.origin); 
	earthquake( 1, 1, mine.origin, 500 );
	mine playSound("exp_suitcase_bomb_stereo");
	mine delete();
	player suicide();
}
Trap8()
{
	trig = getEnt("trigger_trap8","targetname");
	brush1 = getEnt("trap8_1","targetname");
	brush2 = getEnt("trap8_2","targetname");
	brush3 = getEnt("trap8_3","targetname");
	brush4 = getEnt("trap8_4","targetname");
	brush5 = getEnt("trap8_5","targetname");
	brush_trigger1 = getEnt("trap8_trigkill1","targetname"); //Name of your hurt_trigger
	brush_trigger1 enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	brush_trigger1 linkTo(brush1); //Now you must link the trigger to the base
	brush_trigger2 = getEnt("trap8_trigkill2","targetname"); //Name of your hurt_trigger
	brush_trigger2 enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	brush_trigger2 linkTo(brush2); //Now you must link the trigger to the base
	brush_trigger3 = getEnt("trap8_trigkill3","targetname"); //Name of your hurt_trigger
	brush_trigger3 enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	brush_trigger3 linkTo(brush3); //Now you must link the trigger to the base
	brush_trigger4 = getEnt("trap8_trigkill4","targetname"); //Name of your hurt_trigger
	brush_trigger4 enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	brush_trigger4 linkTo(brush4); //Now you must link the trigger to the base
	brush_trigger5 = getEnt("trap8_trigkill5","targetname"); //Name of your hurt_trigger
	brush_trigger5 enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	brush_trigger5 linkTo(brush5); //Now you must link the trigger to the base

	trig waittill("trigger", player);
	
	trig delete();
	
	brush1 moveZ(-288, 1);
	brush2 moveZ(-288, 1);
	brush3 moveZ(-288, 1);
	brush4 moveZ(-288, 1);
	brush5 moveZ(-288, 1);
	wait 2;
	brush1 moveZ(228, 2);
	brush2 moveZ(228, 2);
	brush3 moveZ(288, 2);
	brush4 moveZ(288, 2);
	brush5 moveZ(288, 2);
}
Trap9()
{
    trig = getEnt ("trigger_trap9", "targetname");
    
    trig waittill ("trigger", player);
	
    trig delete();
    
    if (randomInt(2) == 0)
        thread Trap9_1();
    else
        thread Trap9_2();
}
Trap9_1()
{
    trig = getEnt ("trig_trap9_1", "targetname");
    brush1 = getEnt ("trap9_1", "targetname");
	trig enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	trig linkTo(brush1); //Now you must link the trigger to the base
	
    for(;;)
    {
		brush1 moveZ(-320, 1);
		
        trig waittill ("trigger", player);
		
        player suicide();
        wait 0.5;
    }
}
Trap9_2()
{
    trig = getEnt ("trig_trap9_2", "targetname");
	brush2 = getEnt ("trap9_2", "targetname");
	trig enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	trig linkTo(brush2); //Now you must link the trigger to the base
   
    for(;;)
    {
		brush2 moveZ(-320, 1);
		
        trig waittill ("trigger", player);
		
        player suicide();
        wait 0.5;
    }
}
Trap10()
{
    trig = getEnt ("trigger_trap10", "targetname"); 
    brush1 = getEnt ("trap10_1", "targetname");
	brush2 = getEnt ("trap10_2", "targetname");
	brush_trigger1 = getEnt("trap10_trigkill1","targetname"); //Name of your hurt_trigger
	brush_trigger1 enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	brush_trigger1 linkTo(brush1); //Now you must link the trigger to the base
	brush_trigger2 = getEnt("trap10_trigkill2","targetname"); //Name of your hurt_trigger
	brush_trigger2 enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	brush_trigger2 linkTo(brush2); //Now you must link the trigger to the base
	
    trig waittill ("trigger", player);
	
	trig delete();
	
	brush1 moveZ(-272, 1);
	brush2 moveZ(152, 1);
	wait 2;
	brush1 moveZ(272, 2);
	brush2 moveZ(-152,2);
}
Trap11()
{
	trig = getEnt ("trigger_trap11", "targetname"); 
	brush = getEnt ("trap11", "targetname");
    
    trig waittill ("trigger", player);
	
	trig delete();
	
	while(1)
	{
		brush moveZ (-168, 3);
		wait 5;
		brush moveZ (168, 3);
		wait 5;
	}
}
Trap12()
{
	trig = getEnt ("trigger_trap12", "targetname"); 
	brush = getEnt ("trap12", "targetname");
    
    trig waittill ("trigger", player);

	trig delete();
	
	brush notSolid();
	brush hide(); 
}
Trap13()
{
	trig = getEnt ("trigger_trap13", "targetname"); 
	brush1 = getEnt ("trap13_1", "targetname");
	brush2 = getEnt ("trap13_2", "targetname");
	
    trig waittill ("trigger", player);
	
	trig delete();
	
	brush1 moveY (320, 2);
	brush2 moveY (-320, 2);
	wait 4;
	brush1 moveY (-320, 2);
	brush2 moveY (320, 2);
}
Trap14()
{
	trig = getEnt ("trigger_trap14", "targetname"); 
	brush1 = getEnt ("trap14_1", "targetname");
	brush2 = getEnt ("trap14_2", "targetname");

    trig waittill ("trigger", player);
	
	trig delete();
	
	x = randomInt(2);
    if(x == 0)
    {
		brush1 moveZ (-224, 2);
    }
    else if(x == 1)
    {
		brush2 moveZ (-184, 2);
    }
}
Trap15()
{
	trig = getEnt("trigger_trap15","targetname");
	spikes = getEnt("trap15","targetname");
	spikes_trigger = getEnt("trap15_trigkill","targetname"); //Name of your hurt_trigger
	spikes_trigger enableLinkTo(); // This is the most important part of the script. this allows you to move the trigger.
	spikes_trigger linkTo(spikes); //Now you must link the trigger to the base
	
	trig waittill("trigger", player);
	
	trig delete();
	
	spikes moveZ(40, 3);
	wait 4;
	spikes moveZ(-40, 4);
}
OtherShit()
{
	thread DeagleSecret();
	thread DeagleBack();
	//thread SniperAmmo1();
	//thread SniperAmmo2();
	thread ActiMover();
	thread EasyEnd();
	thread HardEnd();
	thread SecretFail1();
	thread SecretFail2();
	thread SecretFail3();
	thread SecretFail4();
	thread SecretFail5();
	thread SecretFail6();
	thread SecretFail7();
	thread SecretFail8();
	thread SecretFail11();
	thread SecretFail12();
	thread StartMenu();
	//thread MusicMenu();
	thread FirstPlace();
	thread addTestClients();
	thread SecretRpg1();
	thread SecretRpg2();
	thread SecretRpg3();
	thread DemKings();
	thread MysteryBox1();
	thread MysteryBox2();
	thread getplayer();
	thread AddTrigsToList();
	thread BounceReset();
	thread Startdoor();
	thread Credits();
	thread Arrow();
	thread Jumppad();
	thread ActiJump1();
	thread Mover1();
	thread Mover2();
	thread Enddoors();
}
DeagleSecret()
{
	trig = getEnt("trigger_deaglesecret","targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		wait 0.1;
		player giveWeapon( "deserteagle_mp" );
		player giveMaxAmmo( "deserteagle_mp" );
		player iPrintlnBold("^5Get the ^9hell ^5out of my secret.");
	}
}
DeagleBack()
{
	trig = getEnt ("trigger_deagleback", "targetname");
	deagleback = getEnt ("origin_deagleback", "targetname");

	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(deagleback.origin);
		player setPlayerAngles(deagleback.angles );
	}
}
SniperAmmo1()
{
	trig = getEnt("trigger_sniperammo1","targetname");

	while(1)
	{
		trig waittill("trigger", player);
		wait 0.1;
		player giveMaxAmmo( "m40a3_mp" );
		player giveMaxAmmo( "remington700_mp" );
		player giveMaxAmmo( "ak47_mp" );
		player iPrintln("Ammo Refilled");
	}
}
SniperAmmo2()
{
	trig = getEnt("trigger_sniperammo2","targetname");

	while(1)
	{
		trig waittill("trigger", player);
		wait 0.1;
		player giveMaxAmmo( "m40a3_mp" );
		player giveMaxAmmo( "remington700_mp" );
		player giveMaxAmmo( "ak47_mp" );
		player iPrintln("Ammo Refilled");
	}
}
ActiMover()
{
	brush = getEnt("acti_mover","targetname");
	
	while(1)
	{
		wait 1;
		brush moveZ (614, 3);
		brush waittill ("movedone");
		wait 1;
		brush moveZ (-614, 4);
		brush waittill ("movedone");
	}
}
EasyEnd()
{
	trig = getEnt ("trigger_easyend", "targetname");
	easyend = getEnt ("origin_easyend", "targetname");

	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(easyend.origin);
		player setPlayerAngles(easyend.angles );
		iPrintlnBold(" ^1" + player.name + "^5 has completed the Easy Room^5!");
		player giveWeapon("deserteagle_mp");
		player switchToWeapon("deserteagle_mp");
	}
}
HardEnd()
{
	trig = getEnt ("trigger_hardend", "targetname");
	hardend = getEnt ("origin_hardend", "targetname");

	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(hardend.origin);
		player setPlayerAngles(hardend.angles );
		wait 0.1;
		iPrintlnBold(" ^1" + player.name + "^5 has completed the Hard Room^5!");
		wait 0.1;
		player giveWeapon("deserteagle_mp");
		player switchToWeapon("deserteagle_mp");
		player giveMaxAmmo("deserteagle_mp");
	}
}
SecretFail1()
{
	trig = getEnt ("secret_fail1", "targetname");
	fail1 = getEnt ("secretfail1_origin", "targetname");

	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(fail1.origin);
		player setPlayerAngles(fail1.angles );
	}
}
SecretFail2()
{
	trig = getEnt ("secret_fail2", "targetname");
	fail2 = getEnt ("secretfail2_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(fail2.origin);
		player setPlayerAngles(fail2.angles );
	}
}
SecretFail3()
{
	trig = getEnt ("secret_fail3", "targetname");
	fail3 = getEnt ("secretfail3_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(fail3.origin);
		player setPlayerAngles(fail3.angles );
	}
}
SecretFail4()
{
	trig = getEnt ("secret_fail4", "targetname");
	fail4 = getEnt ("secretfail4_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);

		player setOrigin(fail4.origin);
		player setPlayerAngles(fail4.angles );
	}
}
SecretFail5()
{
	trig = getEnt ("secret_fail5", "targetname");
	fail5 = getEnt ("secretfail5_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(fail5.origin);
		player setPlayerAngles(fail5.angles );
	}
}
SecretFail6()
{
	trig = getEnt ("secret_fail6", "targetname");
	fail6 = getEnt ("secretfail6_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(fail6.origin);
		player setPlayerAngles(fail6.angles );
	}
}
SecretFail7()
{
	trig = getEnt ("secret_fail7", "targetname");
	fail7 = getEnt ("secretfail7_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);

		player setOrigin(fail7.origin);
		player setPlayerAngles(fail7.angles );
	}
}
SecretFail8()
{
	trig = getEnt ("secret_fail8", "targetname");
	fail8 = getEnt ("secretfail8_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(fail8.origin);
		player setPlayerAngles(fail8.angles );
	}
}
SecretFail11()
{
	trig = getEnt ("secret_fail11", "targetname");
	fail11 = getEnt ("secretfail11_origin", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player setOrigin(fail11.origin);
		player setPlayerAngles(fail11.angles );
	}
}
SecretFail12()
{
	trig = getEnt ("secret_fail12", "targetname");

	for(;;)
	{
		trig waittill ("trigger", player);
		player suicide();
		player iPrintlnBold(player.name+ ", don't be mad, have a flower! *v*");
	}
}
StartMenu()
{
	trig = getEnt("trigger_musicmenu", "targetname");
       
	while(1)
	{
		trig waittill ( "trigger", player );
		
		player thread MusicMenu();
	}
}
MusicMenu()
{
	trig = getEnt("trigger_musicmenu", "targetname");
	
		self endon( "disconnect" );
		self endon( "death" );
		self endon( "spectator" );
	
        self openMenu( "inferno" );
       
        while(1)
        {
                self waittill( "menuresponse", menu, response );
                if( menu != "inferno" )
                        continue;
                switch( response )
                {		
						case "song1":
								self iPrintlnBold("Now Playing: FFDP - Coming Down");
								self playLocalSound("down");
								self closeMenu();
								break;
						case "song2":
								self iPrintlnBold("Now Playing: Power-Man 5000 - Nobody's Real");
								self playLocalSound("real");
								self closeMenu();
								self closeMenu();
								break;
						case "song3":
								self iPrintlnBold("Now Playing: FFDP - The Bleeding");
								self playLocalSound("bleeding");
								self closeMenu();
								break;
						case "song4":
								self iPrintlnBold("Now Playing: Disturbed - Inside the Fire");
								self playLocalSound("fire");
								self closeMenu();
								break;
						case "song5":
								self iPrintlnBold("Now Playing: Disturbed - Indestructible");
								self playLocalSound("destruct");
								self closeMenu();
								break;
						case "escape":
								self closeMenu();
								break;
						default:
								break;
                }
                       
        }
}
FirstPlace()
{
	trig = getEnt("trigger_firstplace", "targetname");
	
	trig waittill("trigger", player);
	
	iPrintlnBold(player.name+ " ^3 has finished the map in First Place!");
}
addTestClients()
{
    setDvar("scr_testclients", "");
    wait 1;
    for(;;)
    {
        if(getdvarInt("scr_testclients") > 0)
            break;
        wait 1;
    }
    testclients = getdvarInt("scr_testclients");
    setDvar( "scr_testclients", 0 );
    for(i=0;i<testclients;i++)
    {
        ent[i] = addtestclient();

        if (!isdefined(ent[i]))
        {
            println("Could not add test client");
            wait 1;
            continue;
        }
        ent[i].pers["isBot"] = true;
        ent[i] thread TestClient("autoassign");
    }
    thread addTestClients();
}

TestClient(team)
{
    self endon( "disconnect" );

    while(!isdefined(self.pers["team"]))
        wait .05;
        
    self notify("menuresponse", game["menu_team"], team);
    wait 0.5;
}
DemKings()
{
	while(1)
	{
		level waittill("player_spawn",player);
		if(player getGuid() == "b53fec25f8ffde138f5fc2e9c6099844" || player getGuid() == "2f0b3d02d050dd7764b3f02cef37d1a5") //1st: DaRKSoUL | 2nd: Tyler
		{
			player giveWeapon("deserteagle_mp");
			player giveWeapon("colt44_mp");
			player switchToWeapon("colt44_mp");
		}
	}
}
SecretRpg1()
{
	trig = getEnt ("trigger_secretrpg1" , "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
	
		player giveWeapon( "rpg_mp" );
		player giveMaxAmmo( "rpg_mp" );
		player switchToWeapon( "rpg_mp" );
	}
}
SecretRpg2()
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
SecretRpg3()
{
	trig = getEnt ("trigger_secretrpg3" , "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		player giveWeapon( "rpg_mp" );
		player giveMaxAmmo( "rpg_mp" );
		player switchToWeapon( "rpg_mp" );
	}
}
MysteryBox1()
{
	trig = getEnt ("trigger_mysterybox1" , "targetname");
		
	for(;;)
	{
		trig waittill("trigger", player);
		
		player iPrintlnBold("Retrieving Weapon....");
		wait 2;
		player giveWeapon("p90_mp");
		player switchToWeapon("p90_mp");
		player giveMaxAmmo("p90_mp");
	}
}
MysteryBox2()
{
	trig = getEnt ("trigger_mysterybox2" , "targetname");
		
	for(;;)
	{
		trig waittill("trigger", player);
		
		player iPrintlnBold("Retrieving Weapon....");
		wait 2;
		player giveWeapon("p90_mp");
		player giveMaxAmmo("p90_mp");
	}
}
getplayer()
{
	return getEntArray( "player", "classname" );
}
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
AddTrigsToList()
{
	addTriggerToList("trigger_trap1");
	addTriggerToList("trigger_trap2");
	addTriggerToList("trigger_trap3");
	addTriggerToList("trigger_trap4");
	addTriggerToList("trigger_trap5");
	addTriggerToList("trigger_trap6");
	addTriggerToList("trigger_trap7");
	addTriggerToList("trigger_trap8");
	addTriggerToList("trigger_trap9");
	addTriggerToList("trigger_trap10");
	addTriggerToList("trigger_trap11");
	addTriggerToList("trigger_trap12");
	addTriggerToList("trigger_trap13");
	addTriggerToList("trigger_trap14");
	addTriggerToList("trigger_trap15");
}
BounceReset()
{
	trig = getEnt ("bounce_reset", "targetname");
	jumper = getEnt ("jumper_reset", "targetname");
	acti = getEnt ("acti_reset", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		if(player.pers["team"] == "allies")
		{
			player SetOrigin(jumper.origin);
			player SetPlayerAngles( jumper.angles );
		}
		else if(player.pers["team"] == "axis")	
		{
			player SetOrigin(acti.origin);
			player SetPlayerAngles( acti.angles );			
		}
	}
}

Startdoor()
{
	brush1 = getEnt("startdoor_1", "targetname");
	brush2 = getEnt("startdoor_2", "targetname");
	
	wait 12;
	brush1 moveZ (1200, 3.5);
	brush2 moveZ (-1250, 3.5);
	brush1 waittill ("movedone");
	brush2 waittill ("movedone");
}
Credits()
{
	if( isDefined( self.logoText ) )
	self.logoText destroy();

	self.logoText = newHudElem();
	self.logoText.y = 10;
	self.logoText.alignX = "center";
	self.logoText.alignY = "middle";
	self.logoText.horzAlign = "center_safearea";

	self.logoText.alpha = 0;
	self.logoText.sort = -3;
	self.logoText.fontScale = 1.6;
	self.logoText.archieved = true;

	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^3Map By: ^1DaRKSoUL");
		wait 8;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 8;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 8;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("Xfire: killswitch2521");
		wait 8;
	}
}
Arrow()
{
	brush = getEnt("arrow_move","targetname");
	
	while(1)
	{
		wait .001;
		brush moveY (-45, 1);
		brush waittill ("movedone");
		wait .001;
		brush moveY (45, 1);
		brush waittill ("movedone");
	}
}
Jumppad()
{
	jumpx = getEnt ("jump","targetname");
	glow = getEnt ("glow","targetname");
	air1 = getEnt ("air1","targetname");
	air2 = getEnt ("air2","targetname");
	air3 = getEnt ("air3","targetname");
	air4 = getEnt ("air4","targetname");

	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = .5;
	for(;;)
	{
		jumpx waittill ("trigger",user);
		if (user isTouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait .5;
			air moveto (air2.origin, time);
			wait .25;
			air moveto (air3.origin, time);
			wait .5;
			air moveto (air4.origin, time);
			wait .5;
			user unlink();
			wait 1;
		}
	}
}
ActiJump1()
{
	jumpx = getEnt ("acti_jump1","targetname");
	glow = getEnt ("acti_glow1","targetname");
	air1 = getEnt ("acti_air1","targetname");
	air2 = getEnt ("acti_air2","targetname");
	air3 = getEnt ("acti_air3","targetname");
	air4 = getEnt ("acti_air4","targetname");
	
	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = .5;
	for(;;)
	{
		jumpx waittill ("trigger",user);
		if (user isTouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait .5;
			air moveto (air2.origin, time);
			wait .25;
			air moveto (air3.origin, time);
			wait .5;
			air moveto (air4.origin, time);
			wait .5;
			user unlink();
			wait 1;
		}
	}
}
Mover1()
{
    brush = getEnt("mover","targetname");
	
	while(1)
	{
		wait .5;
		brush moveX (-1090, 3);
		brush waittill ("movedone");
		wait .5;
		brush moveX (1090, 3);
		brush waittill ("movedone");
	}
}
Mover2()
{
    brush = getEnt("mover2","targetname");
	
	while(1)
	{
		wait 1;
		brush moveX (768, 3.5);
		brush waittill ("movedone");
		wait 1;
		brush moveX (-768, 3.5);
		brush waittill ("movedone");
	}
}
Enddoors()
{
	trig = getEnt("trigger_enddoor", "targetname");
	brush1 = getEnt("enddoor_1", "targetname");
	brush2 = getEnt("enddoor_2", "targetname");
	
	trig waittill("trigger", player);
	
	brush1 moveY (132, 4);
	brush2 moveY (-132, 4);
	brush1 waittill ("movedone");
	brush2 waittill ("movedone");
}
Rooms()
{
	thread SecretRoom();
	thread Bounce();
	thread Sniper();
	thread Ak47();
	thread Inferno();
	thread Old();
}
SecretRoom()
{
	trig = getEnt ("trigger_secretroom", "targetname");
	secret = getEnt ("origin_secretroom", "targetname");

	for(;;)
	{
		trig waittill ("trigger", player);
		
		player iPrintlnBold("^3You Found the ^1Secret Room!^6:3");	
		
		if(player.pers["team"] == "allies")
		{
			player setOrigin(secret.origin);
			player setPlayerAngles(secret.angles );
		}
		else if(player.pers["team"] == "axis")	
		{
			player setOrigin(secret.origin);
			player setPlayerAngles(secret.angles );			
		}
	}
}
Bounce()
{
	level.bounce_trig = getEnt( "trigger_bounce", "targetname");
	jump = getEnt( "bounce_jumper", "targetname" );
	acti = getEnt( "bounce_acti", "targetname" );
	
	while(1)
    {
        level.bounce_trig waittill( "trigger", player );
        if( !isDefined( level.bounce_trig ) )
            return;
        level.ak_trig delete(); //change this
		level.snipe_trig delete(); //change this
		level.old_trig delete(); //change this
		level.inferno_trig delete(); //change this
        if(isDefined(player) && isAlive(player)) //checks if player is defined and alive
        {
            player setPlayerAngles( jump.angles );
            player setOrigin( jump.origin );
            player takeAllWeapons();
            player giveWeapon( "knife_mp" );
            player giveMaxAmmo( "knife_mp" );
            player switchToWeapon( "knife_mp" );
        }
        if(isDefined(level.activ) && isAlive(level.activ)) //Checks if level.activ is defined and activator is alive
        {
            level.activ setPlayerAngles( acti.angles );
            level.activ setOrigin( acti.origin );
            level.activ takeAllWeapons();
            level.activ giveWeapon( "knife_mp" );
            level.activ giveMaxAmmo( "knife_mp" );
            level.activ switchToWeapon( "knife_mp" );
        }
        if(isDefined(player))
            iPrintlnBold( " ^1" + player.name + " ^7has chosen Bounce Room" );
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
        if(isDefined(player))
            iPrintlnBold(player.name + " has Died.");
    }
}
Sniper()
{
	level.snipe_trig = getEnt( "trigger_sniper", "targetname");
	jump = getEnt( "sniper_jumper", "targetname" );
	acti = getEnt( "sniper_acti", "targetname" );
	
	while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
        level.ak_trig delete(); //change this
		level.bounce_trig delete(); //change this
		level.old_trig delete(); //change this
		level.inferno_trig delete(); //change this
        if(isDefined(player) && isAlive(player)) //checks if player is defined and alive
        {
            player setPlayerAngles( jump.angles );
            player setOrigin( jump.origin );
            player takeAllWeapons();
            player giveWeapon( "m40a3_mp" );
			player giveWeapon( "remington700_mp");
            player giveMaxAmmo( "remington700_mp" );
            player giveMaxAmmo( "m40a3_mp" );
            player switchToWeapon( "m40a3_mp" );
        }
        if(isDefined(level.activ) && isAlive(level.activ)) //Checks if level.activ is defined and activator is alive
        {
            level.activ setPlayerAngles( acti.angles );
            level.activ setOrigin( acti.origin );
            level.activ takeAllWeapons();
            level.activ giveWeapon( "m40a3_mp" );
            level.activ giveWeapon( "remington700_mp" );
            level.activ giveMaxAmmo( "remington700_mp" );
            level.activ giveMaxAmmo( "m40a3_mp" );
            level.activ switchToWeapon( "m40a3_mp" );
        }
        if(isDefined(player))
            iPrintlnBold( " ^1" + player.name + " ^7has chosen Sniper Room" );
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
        if(isDefined(player))
            iPrintlnBold(player.name + " has Died.");
    }
}
Ak47()
{
	level.ak_trig = getEnt( "trigger_ak47", "targetname");
	jump = getEnt( "ak47_jumper", "targetname" );
	acti = getEnt( "ak47_acti", "targetname" );
	
	while(1)
    {
        level.ak_trig waittill( "trigger", player );
        if( !isDefined( level.ak_trig ) )
            return;
        level.snipe_trig delete(); //change this
		level.bounce_trig delete(); //change this
		level.old_trig delete(); //change this
		level.inferno_trig delete(); //change this
        if(isDefined(player) && isAlive(player)) //checks if player is defined and alive
        {
            player setPlayerAngles( jump.angles );
            player setOrigin( jump.origin );
            player takeAllWeapons();
            player giveWeapon( "ak47_mp" );
            player giveMaxAmmo( "ak47_mp" );
            player switchToWeapon( "ak47_mp" );
        }
        if(isDefined(level.activ) && isAlive(level.activ)) //Checks if level.activ is defined and activator is alive
        {
            level.activ setPlayerAngles( acti.angles );
            level.activ setOrigin( acti.origin );
            level.activ takeAllWeapons();
            level.activ giveWeapon( "ak47_mp" );
            level.activ giveMaxAmmo( "ak47_mp" );
            level.activ switchToWeapon( "ak47_mp" );
        }
        if(isDefined(player))
            iPrintlnBold( " ^1" + player.name + " ^7has chosen AK47 Room" );
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
        if(isDefined(player))
            iPrintlnBold(player.name + " has Died.");
    }
}
Inferno()
{
	level.inferno_trig = getEnt( "trigger_inferno", "targetname");
	jump = getEnt( "inferno_jumper", "targetname" );
	acti = getEnt( "inferno_acti", "targetname" );
	
	while(1)
    {
        level.inferno_trig waittill( "trigger", player );
        if( !isDefined( level.inferno_trig ) )
            return;
        level.snipe_trig delete(); //change this
		level.bounce_trig delete(); //change this
		level.old_trig delete(); //change this
		level.ak_trig delete(); //change this
        if(isDefined(player) && isAlive(player)) //checks if player is defined and alive
        {
            player setPlayerAngles( jump.angles );
            player setOrigin( jump.origin );
            player takeAllWeapons();
            player giveWeapon( "knife_mp" );
            player giveMaxAmmo( "knife_mp" );
            player switchToWeapon( "knife_mp" );
        }
        if(isDefined(level.activ) && isAlive(level.activ)) //Checks if level.activ is defined and activator is alive
        {
            level.activ setPlayerAngles( acti.angles );
            level.activ setOrigin( acti.origin );
            level.activ takeAllWeapons();
            level.activ giveWeapon( "knife_mp" );
            level.activ giveMaxAmmo( "knife_mp" );
            level.activ switchToWeapon( "knife_mp" );
        }
        if(isDefined(player))
            iPrintlnBold( " ^1" + player.name + " ^7has chosen Inferno Room" );
        while( isDefined( player ) && isAlive( player ) )
            wait 1;
        if(isDefined(player))
            iPrintlnBold(player.name + " has Died.");
    }
}
Old()
{
	level.old_trig = getEnt( "trigger_olddoor", "targetname");
	brush1 = getEnt("olddoor_1", "targetname");
	brush2 = getEnt("olddoor_2", "targetname");
	
	level.old_trig waittill( "trigger", player );
	
	level.snipe_trig delete();
    level.bounce_trig delete();
	level.ak_trig delete();
	level.inferno_trig delete();
	level.old_trig delete();
	
	brush1 moveZ (-276, 4);
	brush2 moveZ (276, 4);
	brush1 waittill ("movedone");
	brush2 waittill ("movedone");
}






//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Escalator()
{
	thread startsteps();
}
startsteps()
{
	start = getEnt("elevator_start", "targetname");
	end = getEnt("elevator_end", "targetname");
	
	step = [];
	for( i = 1; i < 18; i++ )
	{
		step[i] = getEnt( "step_"+(i+1), "targetname" );
	}
	
	//wait 0.1;
	
	while( 1 )
	{
		for( i = 0; i < step.size; i++ )
		{
			step[i] moveTo( (536, -3216, -56), 3 );
			//step[i] waittill("movedone");
			wait 0.05;
			step[i].origin = (start.origin);
			wait 0.05;
		}
	}
}

///////////////////////////////////
//////// END OF ESCALATOR ////////
/////////////////////////////////