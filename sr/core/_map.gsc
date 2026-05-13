#include sr\sys\_events;
#include sr\utils\_common;

main()
{
	level.spawn = [];
	level.colliders = [];
	level.tempEntity = spawn("script_model", (0, 0, 0));

	event("map", ::placeSpawns);
	event("map", ::deleteUnsupportedWeapons);
}

placeSpawns()
{
	level.spawn["allies"] = getEntArray("mp_jumper_spawn", "classname");
	level.spawn["axis"] = getEntArray("mp_activator_spawn", "classname");

	if (getEntArray("mp_global_intermission", "classname").size == 0)
	{
		level.spawn["spectator"] = spawn("script_origin", (0, 0, 0));
		level.spawn["spectator"].angles = (0, 0, 0);
	}
	else
		level.spawn["spectator"] = getEntArray("mp_global_intermission", "classname")[0];

	if (!level.spawn["allies"].size)
		level.spawn["allies"] = getEntArray("mp_dm_spawn", "classname");
	if (!level.spawn["axis"].size)
		level.spawn["axis"] = getEntArray("mp_tdm_spawn", "classname");

	for (i = 0; i < level.spawn["allies"].size; i++)
		level.spawn["allies"][i] placeSpawnPoint();
	for (i = 0; i < level.spawn["axis"].size; i++)
		level.spawn["axis"][i] placeSpawnPoint();

	x = 0;
	y = 0;
	z = 0;

	angles = (0, 180, 0);

	for (i = 0; i < level.spawn["allies"].size; i++)
	{
		x += level.spawn["allies"][i].origin[0];
		y += level.spawn["allies"][i].origin[1];
	}
	if (level.spawn["allies"].size)
	{
		x /= level.spawn["allies"].size;
		y /= level.spawn["allies"].size;
		z = level.spawn["allies"][0].origin[2];

		angles = level.spawn["allies"][0].angles;
	}
	if (!isDefined(level.spawn["player"]))
	{
		level.spawn["player"] = spawn("script_origin", (x, y, z));
		level.spawn["player"].angles = angles;
		level.spawn["player"] placeSpawnPoint();
	}
}

deleteUnsupportedWeapons()
{
	weapons = strTok("knife_mp,m16_gl_mp,ak74u_reflex_mp,ak74u_acog_mp,ak74u_silencer_mp,dog_mp,shovel_mp", ",");

	for (i = 0; i < weapons.size; i++)
	{
		ents = getEntArray("weapon_" + weapons[i], "classname");
		if (!isDefined(ents) || !ents.size)
			continue;

		for (j = 0; j < ents.size; j++)
			ents[j] delete();
	}
}
