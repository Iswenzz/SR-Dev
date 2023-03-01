#include sr\utils\_common;

createNormalWays(token)
{

}

createSecretWays(token)
{

}

changeWay(way)
{
	self iPrintLnBold(way);
}

finishWay(way)
{
	self iPrintLnBold(way);
}

createEndMap(origin, width, height, way)
{
	if (!isDefined(way))
		return sr\api\_map::createEndMap(origin, width, height);

	trigger = spawn("trigger_radius", origin, 0, width, height);
	trigger.radius = width;
	trigger.targetname = "sr_" + way;

	thread watchTriggerEndMap(trigger, way);
	thread sr\game\fx\_trigger::effect(trigger, "red");
	return trigger;
}

watchTriggerEndMap(trig, way)
{
	while (true)
	{
		trig waittill("trigger", player);
		player finishWay(way);
	}
}

createWay(triggerOrigin, width, height, color, way)
{
	trigger = spawn("trigger_radius", triggerOrigin, 0, width, height);
	trigger.radius = width;
	trigger.targetname = "sr_" + way;

	thread watchWay(trigger, way);
	thread sr\game\fx\_trigger::effect(trigger, IfUndef(color, "blue"));
	return trigger;
}

watchWay(trigger, way)
{
	while (true)
	{
		trigger waittill("trigger", player);

		if (isDefined(way))
			player changeWay(way);
	}
}

createTeleporter(triggerOrigin, width, height, origin, angles, state, color, way)
{
	if (!isDefined(way))
		return sr\api\_map::createTeleporter(triggerOrigin, width, height, origin, angles, state, color);

	trigger = spawn("trigger_radius", triggerOrigin, 0, width, height);
	trigger.radius = width;
	trigger.targetname = "sr_" + way;

	thread watchTeleporter(trigger, origin, angles, state, way);
	thread sr\game\fx\_trigger::effect(trigger, IfUndef(color, "blue"));
	return trigger;
}

watchTeleporter(trigger, origin, angles, state, way)
{
	while (true)
	{
		trigger waittill("trigger", player);

		if (isDefined(way))
			player changeWay(way);

		player thread playerTeleport(origin, angles, state);
	}
}

playerTeleport(origin, angles, state)
{
	self endon("death");
	self endon("disconnect");

	if (state == "freeze")
	{
		self sr\api\_player::antiElevator(false);
		self freezeControls(true);
	}

	self setOrigin(origin);
	self setPlayerAngles((0, angles, 0));

	if (state == "freeze")
	{
		wait 0.05;
		self freezeControls(false);
		self sr\api\_player::antiElevator(true);
	}
}

cj()
{
	level.map_cj = true;
}

slide(speed)
{
	level.map_slide = true;
	level.map_slide_multiplier = speed;
}

isCJ()
{
	return isDefined(level.map_cj) && level.map_cj;
}

isSlide()
{
	return isDefined(level.map_slide) && level.map_slide;
}

disableXP()
{
	level.leaderboard_xp_disabled = true;
}
