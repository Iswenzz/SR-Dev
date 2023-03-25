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
		* Script Name:   _endRooms.gsc                   *
		* Script By :     NitroFire                      *
		**************************************************

		[If you plan to use this script, please give credit where it is due.]

*/
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

doEndRooms() {
    //########################### Threads ############################\\
    thread endDoor();

    // Old
    thread oldRoom();

    // Sniper Room
    thread addTeleport("sniper_trigger");
    thread addEndRoom("Sniper", "sniper_trigger", "Press ^3USE ^7to Enter the Sniper Room!", "sniper_jumper_origin", "sniper_activator_origin", "m40a3_mp", "m40a3_mp", 48, 48, "sniper", "Take My Hand", "Panda Eyes (ft. Azuria Sky)");

    // RPG Room
    thread addTeleport("rpg_trigger");
    thread addTeleport("rpg_return"); 
    thread addEndRoom("RPG", "rpg_trigger", "Press ^3USE ^7to Enter the RPG Room!", "rpg_jumper_origin", "rpg_activator_origin", "rpg_mp", "rpg_mp", 10, 10, "rpg", "Once Again", "Tristam");

    // Shotgun Room
    thread addTeleport("shotgun_trigger");
    thread addEndRoom("Shotgun", "shotgun_trigger", "Press ^3USE ^7to Enter the Shotgun Room!", "shotgun_jumper_origin", "shotgun_activator_origin", "m1014_mp", "m1014_mp", 48, 48, "shotgun", "To The Stars", "Braken");


	//########################### End Threads ########################\\

    //########################### Precache ###########################\\

    precacheItem("rpg_mp");
    precacheItem("m1014_mp");

	//######################### End Precache #########################\\
}

endDoor() {
    door = getEnt("end_door", "targetname");
    trig = getEnt("endmap_trig", "targetname");

    trig waittill("trigger", player);
    trig delete();

    iPrintLnBold("^1" + player.name + " ^7has Finished First!");
    
    door moveZ(-122, 2);
    wait 0.5;
}

addTeleport(targetname) {
    trig = getEnt(targetname, "targetname");

    if(isDefined(trig)) {
        for(;;) {
            trig waittill("trigger", player);
            target = getEnt(trig.target, "targetname");
            wait 0.1;
            player setOrigin(target.origin);
            player setplayerangles(target.angles);
            wait 0.1;
        }
    }
}

addEndRoom(name, roomTrigger, hintString, jumperOrigin, activatorOrigin, jumperWeapon, activatorWeapon, jumperWeaponAmmo, activatorWeaponAmmo, music, title, artist) {
    trig = getEnt(roomTrigger, "targetname");

    trig setHintString(hintString);

    //while(true) {
        trig waittill("trigger", player);
        thread waitDead(roomTrigger);
        level.playerInRoom = player;
        // iPrintLnBold("Room Name: ^1" + name + " ^7Room Trigger: ^1" + roomTrigger); // Debug

        iPrintLnBold(player.name + " ^7has Entered the " + name + " Room!");

        ambientStop(2);
        wait 0.75;
        ambientPlay(music, 2);
        iPrintLn("^1>>^7Now Playing: ^1" + title + " ^7 by ^1" + artist + "^7.^1<<");

        player setOrigin(jumperOrigin.origin);
        player setPlayerAngles(jumperOrigin.angles);
        level.activ setOrigin(activatorOrigin.origin);
        level.activ setPlayerAngles(activatorOrigin.angles);

        player freezeControls(true);
        level.activ freezeControls(true);
        wait 0.125;

        player takeAllWeapons();
        level.activ takeAllWeapons();

        player giveWeapon(jumperWeapon);
        level.activ giveWeapon(activatorWeapon);

        player setWeaponAmmoClip(jumperWeapon, jumperWeaponAmmo);
        level.activ setWeaponAmmoClip(activatorWeapon, activatorWeaponAmmo);

        player switchToWeapon(jumperWeapon);
        level.activ switchToWeapon(activatorWeapon);

        iPrintLnBold("^23");
        wait 1;
        iPrintLnBold("^32");
        wait 1;
        iPrintLnBold("^11");
        wait 1;
        iPrintLnBold("^5Fight!");
        wait 0.125;

        player freezeControls(false);
        level.activ freezeControls(false);

        while(isAlive(level.playerInRoom) && isDefined(level.playerInRoom)) {
            wait 1.5;

            if(!isAlive(level.playerInRoom)) {
                iPrintLnBold(level.playerInRoom.name + " has ^1Died^7!");
                level.playerInRoom = undefined;
            }

            trig waittill("trigger", player);
            player iPrintLnBold("^1Wait ^7Your ^1Turn^7!");
        }

    //}
     
}

waitDead(roomTrigger) {
    trig = getEnt(roomTrigger, "targetname");
 
    trig triggerOff();
 
    self common_scripts\utility::waittill_any("death", "disconnect");
    level.activ freezeControls(false);
 
    trig triggerOn();
}

oldRoom() {
    door = getEnt("old_door", "targetname");
    floor = getEnt("acti_floor", "targetname");
    trig = getEnt("old_trigger", "targetname");
    trig setHintString("Press ^3USE ^7to Enter Old!");

    trig waittill("trigger", player);
    trig delete();

    while(isAlive(level.activ) && isDefined(level.activ)) {
        if(level.activ isTouching(floor)) {
            door moveZ(-122, 2);
            wait 0.5;
        } else {
            player iPrintLnBold("The Activator is Already in a Room!");
        }
    }

    
}