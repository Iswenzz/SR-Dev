order()
{
	trigger = getEnt("endmap_trig", "targetname");
	if (!isDefined(trigger) || isDefined(level.orderNoRespawn))
    	return true;
	origin = trigger.origin;
	if (isDefined(level.orderRespawn))
		origin = level.orderRespawn;
	self setOrigin(origin);
	return true;
}
