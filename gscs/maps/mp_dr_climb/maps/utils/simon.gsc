// MIT License

// Copyright (c) 2020 Fraser Watt

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Basic usage:
// The `particpants` parameter should be an array containing the player who chose the room at index 0, and the activator at index 1
// Example:
//
//	//get room participants
//	players = [];
//	players[0] = player;
//	if (isDefined(level.activ) && isAlive(level.activ))
//		players[1] = level.activ;
//
// The `length` parameter is a float and must be greater than the lengthOffset
// initial amount of time in seconds players have to move
//
// Example:
//
// length = 4
//
// The `disableThirdPerson` is a bool which i used to disable the script enabling 3rd person in the room by default
//
// Example:
//
// disableThirdPerson = true; //Script won't enable 3rd person by default
// disableThirdPerson = false; //Script will enable 3rd person by default
//
// maps\utils\simon::main(participants, length, disableThirdPerson);

main(participants, length, disableThirdPerson) {
	self.participants = participants;
	self.colours = getPlatformCount(); //amount of platforms
	self.length = 4; //initial amount of time in seconds players have to move
	self.lengthOffset = 0.2; //amount to decrease the game length per round
	self.spawns = 2; //amount of spawns
	self.disableThridPerson = false;

	if (self.colours == 0)
		return;

	if (isDefined(disableThirdPerson))
		self.disableThridPerson = disableThirdPerson;

	if (isDefined(length) && self.length > self.lengthOffset)
		self.length = length;

	for (i = 0; i < self.participants.size; i++) {
		thread deathListener(self.participants[i]);

		if (!self.disableThridPerson && self.participants[i] getStat(988) == 0) {
			self.participants[i] setClientDvar("cg_thirdperson", 1);
			self.participants[i] setStat(988, 1);
		}
	}

	thread resetListener();
	thread failListener();
	spawnPlayers(false, false);

	level endon("simon_end");

	while (true) {
		randColour = randomInt(self.colours);

		setColour(self.colours, "platform"); //Reset platforms
		setColour(randColour, "display"); //Show the colour to players
		wait(self.length); //wait x amount of time for players to get in position
		setColour(randColour, "platform"); //Remove all platforms except the active colour
		wait(2); //Wait for someone to fall..
		self.length -= self.lengthOffset; //lessen the wait period between showing and removing

		if (self.length < 0)
			thread spawnPlayers(true, true);
	}
}

setColour(id, type) { //toggle platform visibilty & collision
	colours = getEntArray("simon_colour_" + type, "targetname");

	for (i = 0; i < colours.size; i++) {
		if (id == self.colours || id == i) {
			colours[i] show();
			colours[i] solid();
			continue;
		}

		colours[i] hide();
		colours[i] notSolid();
	}
}

failListener() {
	level endon("simon_end");

	failTrigger = getEnt("simon_fall", "targetname");
	failTrigger waittill("trigger", loser);
	thread spawnPlayers(true, true, loser);
}

getPlatformCount() {
	platforms = getEntArray("simon_colour_platform", "targetname");

	if (isDefined(platforms))
		return platforms.size;

	return 0;
}

getRandomSpawn() {
	spawn = spawnStruct();
	spawn.point = randomInt(self.spawns);
	spawn.side = [];
	spawn.side[0] = randomInt(2);
	spawn.side[1] = 0;

	if (spawn.side[0] == spawn.side[1])
		spawn.side[1] = 1;

	return spawn;
}

spawnPlayers(giveKnife, endGame, loser) {
	spawnData = getRandomSpawn();

	for (i = 0; i < self.participants.size; i++) {
		spawn = getEnt("simon_start_spawn_" + spawnData.side[i] + "_" + spawnData.point, "targetname");
		self.participants[i] setOrigin(spawn.origin);
		self.participants[i] setPlayerAngles(spawn.angles);
		self.participants[i] setNormalHealth(100);
		self.participants[i] freezeControls(true);
		self.participants[i] takeAllWeapons();

		if (giveKnife) {
			self.participants[i] giveWeapon("knife_mp");
			self.participants[i] switchToWeapon("knife_mp");
		}
	}

	if (endGame) {
		setColour(self.colours, "platform"); //Reset platforms
		for (i = 0; i < spawnData.side.size; i++) //Setup platform teleports
			thread teleportListener(i);
		for (i = 0; i < self.participants.size; i++) {
			if (!self.disableThridPerson && self.participants[i] getStat(988) == 1) {
				self.participants[i] setClientDvar("cg_thirdperson", 0);
				self.participants[i] setStat(988, 0);
			}
		}
		level notify("simon_end"); //End the game
	}

	for (count = 3; count >= 0; count--) {
		for (i = 0; i < self.participants.size; i++) {
			if (count != 0)
				self.participants[i] iPrintLnBold("^" + count + "" + count);
			else {
				if (!isDefined(loser))
					self.participants[i] freezeControls(false);
				else if (self.participants[i] != loser)
					self.participants[i] freezeControls(false);
			}
		}
		wait(1);
	} //countdown
}

teleportListener(side) { //Teleport players who fall off the platforms
	level endon("simon_reset");

	teleportTrigger = getEnt("simon_teleport_" + side, "targetname");

	if (isDefined(teleportTrigger)) {
		while(true) {
			teleportTrigger waittill("trigger", player);
			spawn = getEnt("simon_start_spawn_" + side + "_" + randomInt(self.spawns), "targetname");
			player setOrigin(spawn.origin);
			player setPlayerAngles(spawn.angles);
		}
	}
}

deathListener(player) { //Listen for player deaths
	level endon("simon_reset");

	while (isDefined(player) && isAlive(player))
		wait(0.1);

	level notify("simon_reset"); //reset map entities
}

resetListener() { //reset platforms
	level waittill("simon_reset");
	setColour(self.colours, "platform");
	level notify("simon_end");
}