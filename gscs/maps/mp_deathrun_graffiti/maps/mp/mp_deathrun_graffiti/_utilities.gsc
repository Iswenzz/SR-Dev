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
		* Script Name:   _utilities.gsc                  *
		* Script By :     NitroFire                      *
		**************************************************

		[If you plan to use this script, please give credit where it is due.]

*/
#include maps\mp\_utility;

doUtilities() {
    level._effect = [];
    level._effect["lightning"] = loadFX("weather/lightning_mp_farm");
    level._effect["rain"] = loadFX("weather/rain_mp_cargoship");

    //########################### Threads ############################\\

	// thread bottomMessages();
    thread barrelFX();
    thread rainFX();
 //    thread music();
    thread doLightning();
 //    thread bounceRoomRespawn();

    level waittill("connected", player);
    player thread forceDvar();

	//########################### End Threads ########################\\

    //########################### Precache ###########################\\



	//######################### End Precache #########################\\
}

music() {
    level waittill("round_started");

    rand = randomIntRange(1, 5);
    wait 3;

    music = [];

    i = 1;
    music[i]["alias"] = "music1";
    music[i]["title"] = "No Fucking Clue";
    music[i]["artist"] = "Idk this Either";

    i++;
    music[i]["alias"] = "music2";
    music[i]["title"] = "Still Alive Remix";
    music[i]["artist"] = "Mt. Eden Dubstep";

    i++;
    music[i]["alias"] = "music3";
    music[i]["title"] = "Bullet Train";
    music[i]["artist"] = "Stephen Swartz (ft. Joni Fatora)";

    i++;
    music[i]["alias"] = "music4";
    music[i]["title"] = "Voice Of The Forest";
    music[i]["artist"] = "Andy Leech ";

    ambientStop(0);
    ambientPlay(music[rand]["alias"]);

    iPrintLn("^1>>^7Now Playing: ^1" + music[rand]["title"] + " ^7 by ^1" + music[rand]["artist"] + "^7.^1<<");
}

bottomMessages() {
    while(1) {
        iPrintLn("^1>>^7Map Created by ^1NitroFire^7.^1<<");
        wait 10;
        iPrintLn("^1>>^7Special Thanks to All of the ^0FAM^9OUS ^7Members.^1<<");
        wait 10;
        iPrintLn("^1>>^7Thanks to ^1Everyone ^7who Tested the Map.^1<<");
        wait 10;
        iPrintLn("^1>>^7Steam: ^1NitroFire1289<<");
        wait 10;
        iPrintLn("^1>>^7Join the ^0FAM^9OUS ^7Discord Here: https://discord.gg/FGnjbpS^1<<");
        wait 10;
    }
}

barrelFX() {
    barrels = getEntArray("fireBarrel", "targetname");
    fire = loadFX("fire/firelp_barrel_pm");
    // iPrintLnBold("Barrel Amount: " + barrels.size); // Debug

    for(i = 0; i < barrels.size; i++) {
        barrels[i] thread loopFX(fire, (0, 0, 30), 1);
        wait 0.125;
    }
}

rainFX() {
    rainOriginArray = getEntArray("rain_origin", "targetname");

    level waittill("connected", player);

    for(i = 0; i < rainOriginArray.size; i++) {
        playFX(level._effect["rain"], rainOriginArray[i].origin);
        wait 0.125;
    }

    while(1) {
        player playLocalSound("rainSFX");
        wait 24;
    }
    
}

doLightning() {
    rainOriginArray = getEntArray("rain_origin", "targetname");
    timeOffset = 6;

    level waittill("connected", player);

    for(i = 0; i < rainOriginArray.size; i++) {
        playFX(level._effect["lightning"], rainOriginArray[i].origin);
        wait timeOffset;
    }
}

bounceRoomRespawn()
{
    trig = getEnt("rpg_return", "targetname");
    acti = getEnt("rpg_activator_origin", "targetname");
    jumper = getEnt("rpg_jumper_origin", "targetname");

    for(;;) {
        trig waittill("trigger",player);

        if(isDefined(level.activ) && player == level.activ) {
            player setOrigin(acti.origin);
            player setPlayerAngles(acti.angles);

            player thread shortFreeze();
        } else {
            player setOrigin(jumper.origin);
            player setPlayerAngles(jumper.angles);

            player thread shortFreeze();
        }
        wait 0.1;
    }
}

shortFreeze()
{
    self endon("death");
    self endon("disconnect");

    self freezeControls(1);
    wait 0.05;
    self freezeControls(0);
}

forceDvar() {
    wait 0.05;

        self setClientDvar("dynent_active","1");
        self setClientDvar("r_detail","1");
        self setClientDvar("r_specular","1");
        self setClientDvar("r_normal","1");
        self setClientDvar("r_drawsun","1");
        self setClientDvar("r_blur","0.3");
        self setClientDvar("cg_drawdecals","1");
        self setClientDvar("r_drawdecals","1");

        self setClientDvar("r_lighttweaksunlight","0.8");
        self setClientDvar("r_filmTweakBrightness","0.22");
        self setClientDvar("r_filmTweakContrast","1.2");
        self setClientDvar("r_filmTweakDarktint","0.7 0.5 0.3");
        self setClientDvar("r_filmTweakDesaturation","0");
        self setClientDvar("r_filmTweakEnable","1");
        self setClientDvar("r_filmTweakLighttint","1.3 1 0.8");
        self setClientDvar("r_filmTweakInvert","0");
        self setClientDvar("r_filmUseTweaks","1");
        self setClientDvar("r_lodBiasRigid","-1000");
        self setClientDvar("r_lodBiasSkinned","-1000");

        self setClientDvar("r_contrast","1.5");
        self setClientDvar("r_specularcolorscale","1");
        self setClientDvar("r_gamma","1");
        self setClientDvar("r_desaturation","0");
        self setClientDvar("r_blur","0.3");
}

/*
    * @param effect - The effect to be looped
    * @param offset - The origin offset (x, y, z)
*/
loopFX(effect, offset, time) {
    level endon("round_ended");
    origin = self.origin + offset;

    while(1) {
        playFX(effect, origin);
        wait time;
    }
}

    