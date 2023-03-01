#include sr\utils\_common;

createEndMap(origin, width, height)
{
	if (isDefined(getEnt("endmap_trig", "targetname")))
	{
		temp = getEnt("endmap_trig", "targetname");
		temp delete();
	}

	trigger = spawn("trigger_radius", origin, 0, width, height);
	trigger.targetname = "endmap_trig";
	trigger.radius = width;
	return trigger;
}

createTeleporter(triggerOrigin, width, height, origin, angles, state, color)
{
	trigger = spawn("trigger_radius", triggerOrigin, 0, width, height);
	trigger.radius = width;
	trigger.targetname = "sr_tp_" + randomInt(99999999);

	thread watchTeleporter(trigger, origin, angles, state);
	thread sr\game\fx\_trigger::effect(trigger, IfUndef(color, "blue"));
	return trigger;
}

watchTeleporter(trigger, origin, angles, state)
{
	while (true)
	{
		trigger waittill("trigger", player);
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

createSpawn(origin, angles)
{
	level.spawn["player"] = spawn("script_origin", (origin[0], origin[1], origin[2] - 60));
	level.spawn["player"].angles = (0, angles, 0);
}

createSpawnOrigin(origin, angles)
{
	level.spawn["player"] = spawn("script_origin", origin);
	level.spawn["player"].angles = (0, angles, 0);
}

createTriggerFx(trigger, fx)
{
	thread sr\game\fx\_trigger::effect(trigger, fx);
}

noFallDamage()
{
	setDvar("bg_falldamagemaxheight", 2000000000);
	setDvar("bg_falldamageminheight", 1500000000);
}

getSpeed(speed)
{
	return speed;
}

getMoveSpeedScale(moveSpeedScale)
{
	return moveSpeedScale;
}

getGravity(gravity)
{
	return gravity;
}

getJumpHeight(jumpHeight)
{
	return jumpHeight;
}
