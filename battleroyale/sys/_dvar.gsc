#include sr\utils\_common;

initDvars()
{
	addDvar("rounds", "br_rounds", 4, 1, 10, "int");
	addDvar("debug", "br_debug", 0, 0, 1, "int");
	addDvar("lobby_countdown", "br_lobby_countdown", 10, 0, 60, "int");
	addDvar("spawn_time", "br_spawn_time", 4, 1, 30, "int");
	addDvar("zone_time", "br_zone_time", 120, 1, 1000, "int");
	addDvar("zone_levels", "br_zone_levels", 0, 0, 4, "int");
	addDvar("plane_duration", "br_plane_seconds", 15, 1, 120, "int");
	addDvar("randomize", "br_randomize", 1, 0, 1, "int");
}

addDvar(scriptName, dvarName, defaultValue, min, max, type)
{
	value = getDvar(dvarName);
	type = IfUndef(type, "string");

	switch (type)
	{
		case "int":		definition = Ternary(IsNullOrEmpty(value), defaultValue, getDvarInt(dvarName));		break;
		case "float": 	definition = Ternary(IsNullOrEmpty(value), defaultValue, getDvarFloat(dvarName));	break;
		default: 		definition = Ternary(IsNullOrEmpty(value), defaultValue, value);					break;
	}
	if ((type == "int" || type == "float") && min != 0 && definition < min)
		definition = min;
	if ((type == "int" || type == "float") && max != 0 && definition > max)
		definition = max;

	if (isNullOrEmpty(value))
		setDvar(dvarName, definition);

	// Maps use level.dvar not level.dvars
	if (!isDefined(level.dvar))
		level.dvar = [];
	level.dvar[scriptName] = definition;
	return definition;
}
