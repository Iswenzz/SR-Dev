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
// The `timer` parameter is an integer and is in seconds from 0-n
// The timer will not activate if `0` is used
// Example:
//
// timer = 0; //don't use timer
// timer = 180; //allow the game to last for 3 minutes
//
// maps\utils\connect4::main(participants, timer);

main(participants, timer) {
	// 0 - Red
	// 1 - Yellow
	self.participants = participants;
	self.sides = 2; //number of sides (Red, Yellow)
	self.colours = [];
	self.colours[0] = "^1Red^7";
	self.colours[1] = "^3Yellow^7"; //Colour definitions for prints
	self.columns = 7; //columns
	self.rows = 6; //rows
	self.moves = 0; //amount of moves
	self.match = 4; //amount of matches in a row needed to win
	self.turn = randomInt(self.sides); //current turn
	self.grid = []; //game grid
	self.rowOffset = getRowOffset(); //space between rows for movement animations
	self.discs = []; //collection of disc entities that have been moved
	self.huds = []; //collection of player hud structs
	self.timer = timer; //timer amount
	self.weapon = "beretta_mp";

	for (col = 0; col < self.columns; col++) {
		self.grid[col] = [];
		for (side = 0; side < self.sides; side++) //create input listeners
			thread addButtonListener(side, col);
		for (row = 0; row < self.rows; row++)
			self.grid[col][row] = self.sides;
	} //create empty grid

	for (side = 0; side < self.sides; side++) {
		for (col = 0; col < self.columns; col++) {
			for (row = 0; row < self.rows; row++) {
				disc = getEnt("connect4_disc_" + side + "_" + col + "_" + row, "targetname");
				if (isDefined(disc))
					disc hide();
			}
		}
	} //hide disc entities

	for (i = 0; i < self.participants.size; i++) {
		spawn = getEnt("connect4_start_spawn_" + i, "targetname");
		self.participants[i] setOrigin(spawn.origin);
		self.participants[i] setPlayerAngles(spawn.angles);
		self.participants[i] setNormalHealth(100);
		self.participants[i] freezeControls(true);
		self.participants[i] takeAllWeapons();
		self.participants[i] giveGun(self.weapon, false);

		thread deathListener(self.participants[i]);
		addInfoHud(self.participants[i]);
	}

	thread resetListener();
	
	for (count = 3; count >= 0; count--) {							
		for (i = 0; i < self.participants.size; i++) {
			if (isDefined(self.participants[i])) {
				if (count != 0)
					self.participants[i] iPrintLnBold("^" + count + "" + count);
				else
					self.participants[i] freezeControls(false);
			}
		}
		wait(1);
	} //countdown

	if (self.timer > 0)
		thread startTimer();
}

addButtonListener(side, col) {
	while (true) {
		level endon("connect4_end");
		trigger = getEnt("connect4_button_" + side + "_" + col, "targetname");
		trigger waittill("trigger", player);

		player giveGun(self.weapon, true); //always fill ammo

		if (self.turn == side) {
			row = getEmptyRow(col); //get empty row

			if (row != -1) { //check if we found an empty row
				insertDisc(side, col, row); //fill row, move disc entity
				if (checkWin(side, col, row)) { //check for winning move
					iPrintLnBold("^1Connect^34");
					iPrintLnBold("^1" + player.name + "^7 has won!"); //anounce winner
					endGame(player);
				}

				if ((self.columns * self.rows) == self.moves) {
					iPrintLnBold("^1Connect^34");
					iPrintLnBold("Draw!");
					endGame();
				}

				self.turn++;

				if (self.turn >= self.sides)
					self.turn = 0;

				for (i = 0; i < self.huds.size; i++)
					updateTurnHud(i);
			}
		} else
			player iPrintLnBold("^1Wait your turn!");
	}
}

getEmptyRow(col) {
	for (row = self.rows - 1; row >= 0; row--) {
		if (self.grid[col][row] == self.sides)
			return row;
	}

	return -1;
}

getRowOffset() {
	board = getEnt("connect4_board", "targetname");

	if (isDefined(board))
		return int(board.script_noteworthy);

	return 0;
}

insertDisc(side, col, row) {
	self.grid[col][row] = side; //fill row with colour
	self.moves++;

	//show and move disc in the map
	disc = getEnt("connect4_disc_" + side + "_" + col + "_" + row, "targetname");

	if (isDefined(disc)) {
		discIdx = self.discs.size;
		self.discs[discIdx] = [];
		self.discs[discIdx]["entity"] = disc;
		self.discs[discIdx]["origin"] = disc getOrigin();

		disc show();
		disc moveZ(0 - (self.rowOffset * (row + 1)), 1);
	}
}

checkWin(side, col, row) {
	//vertical
	if (row <= (self.rows - self.match)) { //check if vertical win is possible
		vertical = true;
		for (offset = 0; offset < self.match; offset++) {
			if (self.grid[col][row + offset] != side) {
				vertical = false;
				break;
			}
		}

		if (vertical)
			return true;	
	}
	//horizontal
	for (col = 0; col <= (self.columns - self.match); col++) {
		horizontal = true;
		for (offset = 0; offset < self.match; offset++) {
			if (self.grid[col + offset][row] != side) {
				horizontal = false;
				break;
			}
		}

		if (horizontal)
			return true;	
	}
	//diagonal
	//top-left to bottom-right
	for (col = 0; col <= (self.columns - self.match); col++) {
		for (row = 0; row <= (self.rows - self.match); row++) {
			diagonal = true;
			for (offset = 0; offset < self.match; offset++) {
				if (self.grid[col + offset][row + offset] != side) {
					diagonal = false;
					break;
				}
			}

			if (diagonal)
				return true;
		}
	}
	//top-right to bottom-left
	for (col = self.columns - 1; col >= (self.columns - self.match); col--) {
		for (row = 0; row <= (self.rows - self.match); row++) {
			diagonal = true;
			for (offset = 0; offset < self.match; offset++) {
				if (self.grid[col - offset][row + offset] != side) {
					diagonal = false;
					break;
				}
			}

			if (diagonal)
				return true;
		}
	}
	//bottom-left to top-right
	for (col = 0; col <= (self.columns - self.match); col++) {
		for (row = self.rows - 1; row > (self.rows - self.match); row--) {
			diagonal = true;
			for (offset = 0; offset < self.match; offset++) {
				if (self.grid[col + offset][row - offset] != side) {
					diagonal = false;
					break;
				}
			}

			if (diagonal)
				return true;			
		}
	}

	//bottom-right to top-left
	for (col = self.columns - 1; col >= (self.columns - self.match); col--) {
		for (row = self.rows - 1; row > (self.rows - self.match); row--) {
			diagonal = true;
			for (offset = 0; offset < self.match; offset++) {
				if (self.grid[col - offset][row - offset] != side) {
					diagonal = false;
					break;
				}
			}

			if (diagonal)
				return true;			
		}
	}

	return false;
}

endGame(winner) {
	for (i = 0; i < self.participants.size; i++) {
		spawn = getEnt("connect4_end_spawn_" + i, "targetname");
		self.participants[i] setOrigin(spawn.origin);
		self.participants[i] setPlayerAngles(spawn.angles);
		self.participants[i] setNormalHealth(100);
		self.participants[i] freezeControls(true);
		self.participants[i] takeAllWeapons();
		self.participants[i] giveWeapon("knife_mp");
		self.participants[i] switchToWeapon("knife_mp");
	}

	for (count = 3; count >= 0; count--) {							
		for (i = 0; i < self.participants.size; i++) {
			if (count != 0)
				self.participants[i] iPrintLnBold("^" + count + "" + count);
			else {
				if (!isDefined(winner))
					self.participants[i] freezeControls(false);
				else if (self.participants[i] == winner)
					self.participants[i] freezeControls(false);
			}
		}
		wait(1);
	} //countdown

	level notify("connect4_end");
}

giveGun(weapon, ammoOnly) {
	if (ammoOnly) {
		if (self hasWeapon(weapon))
			self giveMaxAmmo(weapon);
		return;
	}

	self giveWeapon(weapon);
	self giveMaxAmmo(weapon);
	self switchToWeapon(weapon);
}

deathListener(player) { //Listen for player deaths
	level endon("connect4_reset");

	while (isDefined(player) && isAlive(player))
		wait(0.1);

	level notify("connect4_reset"); //reset map entities
}

resetListener() { //Reset disc entity positions
	level waittill("connect4_reset");

	for (i = 0; i < self.discs.size; i++) {
		if (isDefined(self.discs[i]["entity"])) {
			self.discs[i]["entity"] moveTo(self.discs[i]["origin"], 0.1);
			self.discs[i]["entity"] hide();
		}
	}

	level notify("connect4_end");
}

addHud(label, x, y, alpha, alignX, alignY, fontScale, colour, cb) {
	hud = newClientHudElem(self);
	hud.label = label;
	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.horzAlign = alignX;
    hud.vertAlign = alignY;
	hud.fontScale = fontScale;
	hud.color = colour;
	hud thread [[ cb ]]();

	return hud;
}

addInfoHud(player) {
	infoHud = spawnStruct();
	infoHud.title = player addHud(&"Connect4", 148, -130, 1.0, "left", "bottom", 2.3, (0, 0.498039, 1), ::destroyHudOnEnd);
	infoHud.turn = player addHud(&"^7Turn: &&1", 150, -120, 1.0, "left", "bottom", 1.4, (1, 1, 1), ::destroyHudOnEnd);
	if (self.timer > 0) {
		infoHud.timer = player addHud(&"Time Remaining: ^2&&1", 150, -105, 1.0, "left", "bottom", 1.4, (1, 1, 1), ::destroyHudOnEnd);
		infoHud.timer setValue(self.timer);
	}
	
	hudIdx = self.huds.size;
	self.huds[self.huds.size] = infoHud;
	updateTurnHud(hudIdx);
}

updateTurnHud(side) {
	turnStr = self.colours[self.turn];

	if (self.turn == side)
		turnStr += " (^5YOU^7)";

	self.huds[side].turn setText(turnStr);
}

destroyHudOnEnd() {
	self endon("death");
	level waittill("connect4_end");

	if (isDefined(self))
		self destroy();
}

startTimer(duration) {
	level endon("connect4_end");

	count = 0;

	while(count < self.timer) {
		wait(1);
		count++;
		for (i = 0; i < self.huds.size; i++)
			self.huds[i].timer setValue(self.timer - count);
	}

	endGame();
}
