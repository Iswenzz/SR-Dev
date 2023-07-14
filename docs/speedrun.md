# Speedrun

A speedrun map must have the following features:
- Spawn
- Ways (normal_0 to 6, secret_0 to 6)
- Endmap trigger
- Remove every code that is not necessary for speedrunning (music, iPrintLnBold, rooms, traps)
- Remove moving platforms
- Remove teleporter delays

#### ``createNormalWays(<token>)``
Create normal ways seperated by a ";".

Usage Example:
```c
sr\api\_speedrun::createNormalWays("Normal Way;");
```
<hr>

#### ``createSecretWays(<token>)``
Create secret ways seperated by a ";".

Usage Example:
```c
sr\api\_speedrun::createSecretWays("Secret Way;");
```
<hr>

#### ``changeWay(<way>)``
Change the player's way.

Usage Example:
```c
player sr\api\_speedrun::changeWay("secret_0");
```
<hr>

#### ``finishWay(<way>)``
Finish the player's way.

Usage Example:
```c
player sr\api\_speedrun::finishWay("secret_0");
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
sr\api\_speedrun::createWay((0, 0, 0), 150, 100, "yellow", "normal_1");
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

#### ``cj()``
Make this map a CJ map.

Usage Example:
```c
sr\api\_speedrun::cj("Secret Way;");
```
<hr>

#### ``slide(<speed>)``
Make this map a slide map.

Usage Example:
```c
sr\api\_speedrun::slide(500);
```
<hr>

#### ``disableXP()``
Disable XP.

Usage Example:
```c
sr\api\_speedrun::disableXP();
```
<hr>
