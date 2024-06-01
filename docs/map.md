# Map

Maps can have global movement modifiers and can be set like this:
```c
setDvar("g_speed", 190);
setDvar("dr_jumpers_speed", 1.05);
setDvar("g_gravity", 800);
setDvar("jump_height", 39);
```

#### ``createEndMap(<origin>, <width>, <height>)``
Create an end map trigger.

Usage Example:
```c
sr\api\_map::createEndMap((0, 0, 0), 150, 100);
```
<hr>

#### ``createTeleporter(<triggerOrigin>, <width>, <height>, <origin>, <angles>, <state>, <color>)``
Create a teleporter.

**Parameters:**
* triggerOrigin: The trigger origin.
* width: The trigger width.
* height: The trigger height.
* origin: The teleporter origin.
* angles: The teleporter angles.
* state: "freeze" Will freeze the player on teleporting, "none" will not freeze.
* color: The color of the teleporter trigger.

Usage Example:
```c
sr\api\_map::createTeleporter((0, 0, 0), 150, 100, (0, 0, 0), 90, "none", "blue");
```
<hr>

#### ``createDeath(<triggerOrigin>, <width>, <height>)``
Create a death trigger.

**Parameters:**
* triggerOrigin: The trigger origin.
* width: The trigger width.
* height: The trigger height.

Usage Example:
```c
sr\api\_map::createDeath((0, 0, 0), 150, 100);
```
<hr>

#### ``createSpawn(<origin>, <angles>)``
Create a spawn point.
The origin includes the 60 units of the player and can be used with ``/viewpos`` in the console while standing.

Usage Example:
```c
sr\api\_map::createSpawn((0, 0, 0), 90);
```
<hr>

#### ``createSpawnOrigin(<origin>, <angles>)``
Create an end map trigger.
The origin does not include the 60 units and can be used with ``radiant`` or ``/debug_show_viewpos`` in the console.

Usage Example:
```c
sr\api\_map::createSpawn((0, 0, 0), 90);
```
<hr>

#### ``createTriggerFx(<trigger>, <fx>)``
Create a trigger FX.

Usage Example:
```c
sr\api\_map::createTriggerFx(trigger, "blue");
```
<hr>

#### ``noFallDamage()``
Enable no fall damage.

Usage Example:
```c
sr\api\_map::noFallDamage();
```
<hr>

#### ``getSpeed(<speed>)``
Get the accurate speed conversion if the map has a modifier.

Usage Example:
```c
sr\api\_map::getSpeed(190);
```
<hr>

#### ``getMoveSpeedScale(<origin>)``
Get the accurate speed scale conversion if the map has a modifier.

Usage Example:
```c
sr\api\_map::getMoveSpeedScale(1.05);
```
<hr>

#### ``getGravity(<origin>)``
Get the accurate gravity conversion if the map has a modifier.

Usage Example:
```c
sr\api\_map::getGravity(800);
```
<hr>

#### ``getJumpHeight(<origin>)``
Get the accurate jump height conversion if the map has a modifier.

Usage Example:
```c
sr\api\_map::getJumpHeight(39);
```
<hr>
