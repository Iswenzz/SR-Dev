# Deathrun

A deathrun map must have the following features:
- Spawn
- Endmap trigger
- Rooms order

#### ``order()``
Check if the player can enter the end room.

Usage Example:
```c
while (true)
{
	trig waittill("trigger", player);

	if (!player sr\api\_deathrun::order())
		continue;

	iPrintLnBold(player.name + "^4 has entered the ^2Knife Room");
	player finalRoom("knife_mp", 100);
	level.activ finalRoom("knife_mp", 100);
}
```
<hr>

#### ``createNormalWays(<token>)``
Create normal ways seperated by a ";".

Usage Example:
```c
sr\api\_deathrun::createNormalWays("Normal Way;");
```
<hr>

#### ``createSecretWays(<token>)``
Create secret ways seperated by a ";".

Usage Example:
```c
sr\api\_deathrun::createSecretWays("Secret Way;");
```
<hr>

#### ``changeWay(<way>)``
Change the player's way.

Usage Example:
```c
player sr\api\_deathrun::changeWay("secret_0");
```
<hr>

#### ``finishWay(<way>)``
Finish the player's way.

Usage Example:
```c
player sr\api\_deathrun::finishWay("secret_0");
```
<hr>

#### ``createEndMap(<origin>, <width>, <height>, <?way>)``
Create an end map trigger, if the ``way`` parameter is not specified, the trigger will end any player ways.

Usage Example:
```c
sr\api\_map::createEndMap((0, 0, 0), 150, 100);
```
<hr>

#### ``createWay(<triggerOrigin>, <width>, <height>, <color>, <way>)``
Create a trigger that will change the player's way.

Usage Example:
```c
sr\api\_deathrun::createWay((0, 0, 0), 150, 100, "yellow", "normal_1");
```
<hr>

#### ``createTeleporter(<triggerOrigin>, <width>, <height>, <origin>, <angles>, <state>, <color>, <way>)``
Create a teleporter.

**Parameters:**
* triggerOrigin: The trigger origin.
* width: The trigger width.
* height: The trigger height.
* origin: The teleporter origin.
* angles: The teleporter angles.
* state: "freeze" Will freeze the player on teleporting, "none" will not freeze.
* color: The color of the teleporter trigger.
* way: Change the way on teleporting.

Usage Example:
```c
sr\api\_map::createTeleporter((0, 0, 0), 150, 100, (0, 0, 0), 90, "none", "blue", "secret_0");
```
<hr>

#### ``disableXP()``
Disable XP.

Usage Example:
```c
sr\api\_deathrun::disableXP();
```
<hr>
