removeAllMapTriggers()
{
	sr\api\_battleroyale::removeAllMapTriggers();
}

removeAllSpawns()
{
	sr\api\_battleroyale::removeAllSpawns();
}

createSpawn(origin, angle)
{
	sr\api\_battleroyale::createSpawn(origin, angle);
}

createLobbyBlocker(origin, width, height)
{
	return sr\api\_battleroyale::createLobbyBlocker(origin, width, height);
}

createPlanePath(start, end, angle)
{
	sr\api\_battleroyale::createPlanePath(start, end, angle);
}

createPlaneDrop(origin)
{
	sr\api\_battleroyale::createPlaneDrop(origin);
}

createPlaneDropTrigger(origin, radius)
{
	sr\api\_battleroyale::createPlaneDropTrigger(origin, radius);
}

createPlaneDuration(seconds)
{
	sr\api\_battleroyale::createPlaneDuration(seconds);
}

createZone(origin)
{
	sr\api\_battleroyale::createZone(origin);
}

createZoneLevels(levels)
{
	sr\api\_battleroyale::createZoneLevels(levels);
}

createEntity(id, origin)
{
	return sr\api\_battleroyale::createEntity(id, origin);
}

createEntities(id, origins)
{
	return sr\api\_battleroyale::createEntities(id, origins);
}

createAmmo(id, model, sound, icon, count, rng)
{
	return sr\api\_battleroyale::createAmmo(id, model, sound, icon, count, rng);
}

createWeapon(id, mag, sound, icon, weapon, rng)
{
	return sr\api\_battleroyale::createWeapon(id, mag, sound, icon, weapon, rng);
}

createSpecial(id, model, sound, icon, rng)
{
	return sr\api\_battleroyale::createSpecial(id, model, sound, icon, rng);
}

createGrenade(id, sound, icon, weapon, rng)
{
	return sr\api\_battleroyale::createGrenade(id, sound, icon, weapon, rng);
}
