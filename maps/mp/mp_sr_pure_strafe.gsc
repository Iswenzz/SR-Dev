#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	maps\mp\enter_teleport\_teleport::main();
	maps\mp\_compass::setupMiniMap("compass_mp_sr_pure_strafe");

	thread sr\api\_map::createSpawnOrigin((6394.125, 9372, -773.875), 180);

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar("r_specularcolorscale", "1");
	setdvar("compassmaxrange", "1600");
	setdvar("r_glowbloomintensity0", ".1");
	setdvar("r_glowbloomintensity1", ".1");
	setdvar("r_glowskybleedintensity0", ".1");
	setDvar("bg_falldamagemaxheight", 20000000);
	setDvar("bg_falldamageminheight", 15000000);

	visionSetNaked("mp_dr_portal", 0);

	SetExpFog(768, 1500, 123 / 255, 155 / 255, 175 / 255, 3);

	sr\api\_speedrun::createNormalWays("Normal Way;");
	sr\api\_speedrun::createSecretWays("Secret Way;");

	thread onConnect();
}

onConnect()
{
	thread secret();

	while (true)
    {
        level waittill("connected", player);
        player tweaks();
    }
}

tweaks()
{
	self setClientDvar("r_specular", "1");
	self setClientDvar("r_glow", "0");
	self setClientDvar("r_specularmap", "3");
	self setClientDvar("r_filmusetweaks", "1");
	self setClientDvar("r_fog", "1");
	self setClientDvar("r_lighttweaksunlight", "0.8");
	self setClientDvar("r_filmtweakcontrast", "1");
	self setClientDvar("r_filmtweakbrightness", "0");
	self setClientDvar("r_filmtweakdarktint", "1.3 1.3 1.7");
	self setClientDvar("r_filmtweaklighttint", "1 1 1");
	self setClientDvar("r_filmtweakenable", "1");
	self setClientDvar("r_filmtweakdesaturation", "0");
}

secret()
{
	trig = spawn("trigger_radius", (6976, 9149, -757.5), 0, 80, 512);
	ori = getEnt("secret_1_ori", "targetname");

	thread secret_end();

	wait 1;
	trig.radius = 80;
	thread sr\api\_map::createTriggerFx(trig, "secret");

	while (true)
	{
		trig waittill("trigger",player);

		player setOrigin(ori.origin);
		player setPlayerAngles(ori.angles);
		player sr\api\_speedrun::changeWay("secret_0");
	}
}

secret_end()
{
	trig = getEnt("secret_end", "targetname");

	while (true)
	{
		trig waittill("trigger",player);
		player thread sr\api\_speedrun::finishWay("secret_0");
	}
}
