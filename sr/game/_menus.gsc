#include sr\sys\_events;
#include sr\utils\_common;

main()
{
	precache();

	menu("-1", 			"save", 		::menu_Save);
	menu("-1", 			"dog", 			::menu_Dog);
	menu("-1", 			"back", 		::menu_Back);
	menu("quickstuff", 	"3rdperson", 	::menu_3rdPerson);
	menu("quickstuff", 	"suicide", 		::menu_Suicide);
	menu("main_mp", 	"allies", 		::menu_Team);
	menu("main_mp", 	"axis", 		::menu_Team);
	menu("main_mp", 	"autoassign", 	::menu_Team);
	menu("main_mp", 	"spectator", 	::menu_Spectator);

	menu_callback("quickcommands",	 	maps\mp\gametypes\_quickmessages::quickcommands);
	menu_callback("quickstatements", 	maps\mp\gametypes\_quickmessages::quickstatements);
	menu_callback("quickresponses",  	maps\mp\gametypes\_quickmessages::quickresponses);

	game["menu_main"] = "main_mp";
}

precache()
{
	precacheMenu("main/main_mp");
	precacheMenu("commands/wm_quickmessage");
	precacheMenu("commands/quickcommands");
	precacheMenu("commands/quickresponses");
	precacheMenu("commands/quickstatements");
	precacheMenu("options/sr_settings");
	precacheMenu("controls/controls_multi");
	precacheMenu("popups/exit");
	precacheMenu("misc/clientcmd");
	precacheMenu("misc/endofgame");
	precacheMenu("misc/scoreboard");
	precacheMenu("misc/muteplayer");
}

menu_Save(arg)
{

}

menu_Dog(arg)
{
	self.pers["isDog"] = !self.pers["isDog"];
}

menu_Back(arg)
{
	self closeMenu();
	self closeInGameMenu();
}

menu_3rdPerson(arg)
{
	state = !self getStat(988);
	self iPrintln("Third Person Camera " + Ternary(state, "^2Enabled", "^1Disabled"));
	self setClientDvar("cg_thirdperson", state);
	self setStat(988, state);
}

menu_Suicide(arg)
{
	if (self.pers["team"] == "axis")
	{
		self iPrintLn("^1Suicide disabled");
		return;
	}
	self suicide();
}

menu_Team(arg)
{
	self closeMenu();
	self closeInGameMenu();

	if (game["state"] == "end")
		return;

	if (self.pers["team"] == "axis")
	{
		self iPrintLn("^1Suicide disabled");
		return;
	}
	self sr\game\_teams::setTeam("allies");

	if (self canSpawn())
		self eventSpawn();
}

menu_Spectator(arg)
{
	self closeMenu();
	self closeInGameMenu();

	if (game["state"] == "end" || self.pers["team"] == "axis")
		return;

	self sr\game\_teams::setTeam("spectator");
	self sr\game\_teams::setSpectatePermissions();
	self eventSpectator();
}
