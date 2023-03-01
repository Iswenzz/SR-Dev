antiElevator(state)
{
	iPrintLnBold("^5Elevator:^7 " + state);
}

setPlayerSpeed(speed)
{
	self.speed = int(ceil(speed * (self.spawnSpeed / 190)));
	setDvar("g_speed", self.speed);
}

setPlayerSpeedScale(moveSpeedScale)
{
	self.moveSpeedScale = moveSpeedScale * (self.spawnMoveSpeedScale / 1.0);
	self setMoveSpeedScale(self.moveSpeedScale);
}

setPlayerGravity(gravity)
{
	self.gravity = int(ceil(gravity * (self.spawnGravity / 800)));
	setDvar("g_gravity", self.gravity);
}

setPlayerJumpHeight(jumpHeight)
{
	self.jumpHeight = int(ceil(jumpHeight * (self.spawnJumpHeight / 39)));
	setDvar("jump_height", self.jumpHeight);
}
