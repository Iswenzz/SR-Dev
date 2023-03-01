#include sr\sys\_events;
#include sr\utils\_common;

main()
{
	event("map", ::endmapTrigger);
}

endmapTrigger()
{
	waitMapLoad(3);

	array = getEntArray("endmap_trig", "targetname");
	if (!array.size)
	{
		iPrintLn("^1Error: No endmap_trig found.");
		return;
	}

	trigger = array[0];
	thread sr\game\fx\_trigger::effect(trigger, "red");
	while (true)
	{
		trigger waittill("trigger", player);
		player thread endTimer();
	}
}

start()
{
	sr\sys\_dvar::reset();
	self.finishedMap = false;

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.12);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(210);

	if (sr\api\_speedrun::isSlide())
	{
		self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.8);
		self.gravity = sr\api\_map::getGravity(1000);
		self.jumpHeight = sr\api\_map::getJumpHeight(70);
		self.speed = sr\api\_map::getSpeed(190 * level.map_slide_multiplier);
	}

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	setDvar("g_gravity", self.gravity);
	setDvar("jump_height", self.jumpHeight);
	setDvar("g_speed", self.speed);

	self thread playerTimer();
}

playerTimer()
{
	self endon("spawned");
	self endon("disconnect");
	self endon("death");

	if (self.finishedMap)
		return;
	self.time = undefined;

	// Spastic delay caused by bad modding, too bad...
	wait 0.1;

	self sr\player\huds\_speedrun::updateTime();
	self.time = originToTime(getTime());
}

endTimer()
{
	if (!self isPlaying() || !isDefined(self.time) || self.finishedMap)
		return;
	self.finishedMap = true;

	self.time = originToTime(getTime() - self.time.origin);
	self sr\player\huds\_speedrun::updateTime();
}
