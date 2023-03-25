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
		* Script Name:   _vip.gsc                        *
		* Script By :     NitroFire                      *
		**************************************************

		[If you plan to use this script, please give credit where it is due.]

*/

doVip() {
    level.guid = "";
    level.shortGuid = "";
    level.isVip = false;
    level.vips = [];
    level.players = getEntArray("player", "classname");

    //########################### Threads ############################\\
    
    thread onPlayerConnected();
    thread vipDoor();
    thread maps\mp\mp_deathrun_graffiti\_endrooms::addTeleport("vip_trigger");

	//########################### End Threads ########################\\

    //########################### Precache ###########################\\



	//######################### End Precache #########################\\
}

onPlayerConnected() {
    level waittill("connected", player);
    level waittill("round_started");

    level.guid = player getGuid();
    level.shortGuid = getSubStr(level.guid, 12, 19); // Last 7 Digits of the Player's GUID.
    // iPrintLnBold("Last 7 Digits of GUID: " + shortGuid); Debug

    for(i = 0; i < level.players.size; i++) {
        level.players[i] thread checkVip(level.shortGuid);
    }
    wait 0.5;
}

vipDoor() {
    level waittill("connected", player);

    trig = getEnt("vip_trigger", "targetname");
    level.guid = player getGuid();
    level.shortGuid = getSubStr(level.guid, 12, 19); // Last 7 Digits of the Player's GUID.

    trig setHintString("Press ^3USE ^7to Enter the VIP Lounge.");
    trig waittill("trigger", player);

    player thread checkVip(level.shortGuid);
}

checkVip(shortGuid) {
    level waittill("connected", player);
    level waittill("round_started");
    trig = getEnt("vip_trigger", "targetname");

    level.vips["nitro"] = "";
    level.vips["easy"] = "";
    level.vips["lolz"] = "";
    
    if(shortGuid == level.vips["nitro"] || shortGuid == level.vips["easy"] || shortGuid == level.vips["lolz"]) {
        level.isVip = true;
        player setOrigin(trig.target.origin);
        player setPlayerAngles(trig.target.angles);
    } else {
        level.isVip = false;
        player iPrintLnBold("Sorry, but you're not a VIP.");
    }
}