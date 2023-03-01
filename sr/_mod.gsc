main()
{
	precache();
	precacheText();
	precacheFx();

	sr\sys\_dvar::initDvars();
	sr\sys\_events::initEvents();

	maps\mp\gametypes\_hud::init();
	maps\mp\gametypes\_hud_message::init();
	maps\mp\gametypes\_damagefeedback::init();
	maps\mp\gametypes\_clientids::init();
	maps\mp\gametypes\_gameobjects::init();
	maps\mp\gametypes\_gameobjects::main([]);
	maps\mp\gametypes\_spawnlogic::init();
	maps\mp\gametypes\_oldschool::deletePickups();
	maps\mp\gametypes\_hud::init();
	maps\mp\gametypes\_quickmessages::init();
	maps\mp\gametypes\_weapons::init();

	braxi\_mod::main();

	sr\game\_map::main();
	sr\game\_edit::main();
	sr\game\_match::main();
	sr\game\_menus::main();
	sr\game\_triggers::main();
	sr\player\_settings::main();
}

precache()
{
	level.assets = [];
	level.texts = [];
	level.gfx = [];

	precacheItem("knife_mp");
	precacheItem("dog_mp");
	precacheItem("tomahawk_mp");
	precacheItem("claymore_mp");
	precacheItem("c4_mp");
	precacheItem("rpg_mp");
	precacheItem("frag_grenade_short_mp");
	precacheItem("frag_grenade_mp");
	precacheItem("smoke_grenade_mp");
	precacheItem("flash_grenade_mp");

	precacheShader("black");
	precacheShader("white");
	precacheShader("killiconsuicide");
	precacheShader("killiconmelee");
	precacheShader("killiconheadshot");
	precacheShader("killiconfalling");
	precacheShader("stance_stand");
	precacheShader("hudstopwatch");
	precacheShader("score_icon");
	precacheShader("time_hud");
	precacheShader("speedrunner_logo");

	precacheStatusIcon("hud_status_connecting");
	precacheStatusIcon("hud_status_dead");

	precacheModel("tag_origin");
	precacheModel("viewmodel_hands_zombie");
	precacheModel("body_mp_usmc_cqb");
}

precacheText()
{
	level.texts["empty"] 				= &"";
	level.texts["time"] 				= &"^2&&1";
	level.texts["ended_game"]			= &"MP_HOST_ENDED_GAME";
	level.texts["endgame"]				= &"MP_HOST_ENDGAME_RESPONSE";

	precacheString(level.texts["empty"]);
	precacheString(level.texts["time"]);
	precacheString(level.texts["ended_game"]);
	precacheString(level.texts["endgame"]);
}

precacheFx()
{
	level.gfx["pickup"]	= loadFx("misc/ui_pickup_available");

	visionSetNaked(toLower(level.map), 0);
}
