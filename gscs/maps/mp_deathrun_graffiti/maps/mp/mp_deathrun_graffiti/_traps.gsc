/*

              _..-'(                       )`-.._
           ./'. '||\\.       (\_/)       .//||` .`\.
        ./'.|'.'||||\\|..    )O O(    ..|//||||`.`|.`\.
     ./'..|'.|| |||||\`````` '`"'` ''''''/||||| ||.`|..`\.
   ./'.||'.|||| ||||||||||||.     .|||||||||||| ||||.`||.`\.
  /'|||'.|||||| ||||||||||||{     }|||||||||||| ||||||.`|||`\
 '.|||'.||||||| ||||||||||||{     }|||||||||||| |||||||.`|||.`
'.||| ||||||||| |/'   ``\||``     ''||/''   `\| ||||||||| |||.`
|/' \./'     `\./         \!|\   /|!/         \./'     `\./ `\|
V    V         V          }' `\ /' `{          V         V    V
`    `         `               V               '         '    '


		**************************************************
		*       NitroFire                                *
		*                                                *
		* Steam:      NitroFire1289                      *
		* Script Name:   _traps.gsc                      *
		* Script By :     NitroFire                      *
		**************************************************

		[If you plan to use this script, please give credit where it is due.]

*/

doTraps() {
    //########################### Threads ############################\\

    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();
    thread trap8();
    thread trap9();

    //########################### End Threads ########################\\
}

trap1() {
    platform = getEnt("trap_01", "targetname");
    trig = getEnt("trap_01_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Spin the Platform.");

    trig waittill("trigger", player);
    trig delete();

    for(;;) {
        platform rotateRoll(720, 2);
        wait 5;
    }
}

trap2() {
    left = getEnt("trap_02_left", "targetname");
    right = getEnt("trap_02_right", "targetname");
    trig = getEnt("trap_02_trigger", "targetname");
    rand = randomIntRange(1, 3);
    trig setHintString("Press ^3USE ^7to Delete Platforms.");

    trig waittill("trigger", player);
    trig delete();

    switch(rand) {
        case 1:
            left hide();
            left notSolid();
        break;

        case 2:
            right hide();
            right notSolid();
        break;
    }
}

trap3() {
    wall = getEnt("trap_03", "targetname");
    trig = getEnt("trap_03_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Spin the Walls.");

    trig waittill("trigger", player);
    trig delete();

    for(;;) {
        wall rotateYaw(720, 2);
        wait 5;
    }
}

trap4() {
    bridge = getEnt("trap_04", "targetname");
    trig = getEnt("trap_04_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Delete Parts of the Bridge.");

    trig waittill("trigger", player);
    trig delete();
    
    bridge hide();
    bridge notSolid();
}

trap5() {
    left = getEnt("trap_05_left", "targetname");
    right = getEnt("trap_05_right", "targetname");
    trig = getEnt("trap_05_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Remove the Floor.");

    trig waittill("trigger", player);
    trig delete();

    left rotateRoll(90, 1);
    right rotateRoll(-90, 1);
    wait 1;
}

trap6() {
    left = getEnt("trap_06_left", "targetname");
    right = getEnt("trap_06_right", "targetname");
    trig = getEnt("trap_06_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Move the Platforms.");

    trig waittill("trigger", player);
    trig delete();

    while(1) {
        left moveY(400, 1.5);
        right moveY(-400, 1.5);
        wait 3;

        left moveY(-400, 1.5);
        right moveY(400, 1.5);
        wait 3;
    }
}

trap7() {
    bounce = getEnt("trap_07", "targetname");
    trig = getEnt("trap_07_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Delete the Bounce.");

    trig waittill("trigger", player);
    trig delete();

    bounce hide();
    bounce notSolid();
}

trap8() {
    wall = getEnt("trap_08", "targetname");
    trig = getEnt("trap_08_trigger", "targetname");
    dmgTrig = getEnt("maze_dmg", "targetname");
    players = getEntArray("player", "classname");
    explosion = loadFX("explosions/airlift_explosion_large");
    smoke = loadFX("smoke/ic_grnd_smoke");
    trig setHintString("Press ^3USE ^7to Explode the Maze.");

    wall hide();
    wall notSolid();

    trig waittill("trigger", player);
    trig delete();
    
    wall show();
    wall solid();
    //iPrintLnBold("Wall has been Shown.");
    wait 0.5;

    iPrintLnBold("Player Amount: " + players.size);

    // for(i = 0; i < players.size; i++) {
    //     if(players[i] isTouching(dmgTrig)) {
    //         iPrintLnBold("If Started");
    //         players[i] iPrintLnBold("You have been trapped!");

    //         wait 3;

    //         EarthQuake( 1, 1, dmgTrig.origin, 2000 );
    //         playFX(explosion, dmgTrig.origin);
    //         playFX(smoke, dmgTrig.origin);
    //         players[i] playLocalSound("explosionSFX", 3);
    //         player playLocalSound("explosionSFX", 3);

    //         players[i] suicide();

    //         iPrintLnBold("If Ran Successfully");
    //     } else {
    //         iPrintLnBold("If Did Not Run Successfully.");
    //     }

    //     wait 0.1;
    // }

    // iPrintLnBold("For Loop Ran Successfully.");

    wait 0.1;


    wall hide();
    wall notSolid();    

    //iPrintLnBold("Wall has been Hidden again.");
}

trap9() {
    left = getEnt("trap_09_left", "targetname");
    right = getEnt("trap_09_right", "targetname");
    trig = getEnt("trap_09_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Swing the Blocks.");

    trig waittill("trigger", player);
    trig delete();

    left rotateRoll(90, 1);
    right rotateRoll(-90, 1);
    wait 1.5;

    for(;;) {
        left rotateRoll(-180, 1);
        right rotateRoll(180, 1);
        wait 1.5;

        left rotateRoll(180, 1);
        right rotateRoll(-180, 1);
        wait 1.5;
    }
}
