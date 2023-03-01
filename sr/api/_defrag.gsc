#include sr\utils\_common;

weapons(list)
{

}

perks(list)
{

}

triggerSection(id, origin, width, height, callback)
{
	trigger = spawn("trigger_radius", origin, 0, width, height);
	trigger.targetname = "defrag_section";
	trigger.radius = width;
	trigger.callback = callback;
	trigger.id = id;

	return trigger;
}

triggerWeapon(id, origin, width, height, weapon, ammo)
{
	trigger = spawn("trigger_radius", origin, 0, width, height);
	trigger.targetname = "defrag_weapon";
	trigger.radius = width;
	trigger.weapon = weapon;
	trigger.ammo = ammo;
	trigger.id = id;

	return trigger;
}

triggerPerk(id, origin, width, height, perk, time)
{
	trigger = spawn("trigger_radius", origin, 0, width, height);
	trigger.targetname = "defrag_perk";
	trigger.radius = width;
	trigger.perk = perk;
	trigger.time = time;
	trigger.id = id;

	return trigger;
}

switchToDefragWeapon(name)
{

}

takeDefragWeapon(name)
{

}

takeAllPerks(name)
{

}

takeDefragPerk(name)
{

}

giveDefragWeapon(name, ammo)
{

}

giveDefragPerk(name, time)
{

}
