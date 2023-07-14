# BattleRoyale

A battle royale map must have the following features:
- Spawn
- Zones
- Plane path, drop origin, drop trigger
- Entities of different assets such as weapons, ammos, grenades, specials

*``battleroyale\game\_api`` can also be ``sr\api\_battleroyale`` if the target is SR servers.*

#### ``removeAllMapTriggers()``
Remove all triggers, used in stock maps to prevent trigger conflicts.

Usage Example:
```c
thread battleroyale\game\_api::removeAllMapTriggers();
```
<hr>

#### ``removeAllSpawns()``
Remove all stock spawns, used in stock maps to control the lobby area.

Usage Example:
```c
thread battleroyale\game\_api::removeAllSpawns();
```
<hr>

#### ``createSpawn(<origin>, <angle>)``
Create a spawn for the lobby area.

Usage Example:
```c
battleroyale\game\_api::createSpawn((0, 0, 0), 90);
```
<hr>

#### ``createLobbyBlocker(<origin>, <width>, <height>)``
Add a blocker that will be deleted when the game starts.

Usage Example:
```c
battleroyale\game\_api::createLobbyBlocker((100, 200, 300), 200, 300);
```
<hr>

#### ``createPlanePath(<start>, <end>, <angle>)``
Add a path to the plane paths.

Usage Example:
```c
battleroyale\game\_api::createPlanePath((-1000, 0, 1000), (1000, 0, 1000), 90);
```
<hr>

#### ``createPlaneDrop(<origin>)``
Add the default plane dropping origin, if someone afk or gets stuck.

Usage Example:
```c
battleroyale\game\_api::createPlaneDrop((0, 0, 1000));
```
<hr>

#### ``createPlaneDropTrigger(<origin>, <radius>)``
Add a trigger for the plane dropping area where you can press F to drop.

Usage Example:
```c
battleroyale\game\_api::createPlaneDropTrigger((0, 0, 1000), 5000);
```
<hr>

#### ``createPlaneDuration(<seconds>)``
Sets the plane path duration.

Usage Example:
```c
battleroyale\game\_api::createPlaneDuration(60);
```
<hr>

#### ``createZone(<origin>)``
Add origins to the list of final zones.

Usage Example:
```c
battleroyale\game\_api::createZone((0, 0, 0));
```
<hr>

#### ``createZoneLevels(<levels>)``
Defines the level size for the current map.

Usage Example:
```c
battleroyale\game\_api::createZoneLevels(0);
```
<hr>

#### ``createEntity(<id>, <origin>)``
Spawn a battleroyale entity at the specified origin.

Usage Example:
```c
battleroyale\game\_api::createEntity("m16", (0, 0, 0));
```
<hr>

#### ``createWeapon(<id>, <mag>, <sound>, <icon>, <weapon>, <rng>)``
Create a weapon.

**Parameters:**
* id: Weapon id.
* mag: Weapon mag id.
* sound: Pickup sound allias.
* icon: Icon material.
* weapon: Weapon item id.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
battleroyale\game\_api::createWeapon("m16", "5_45", "weap_raise_plr", "hud_icon_m16a4", "m16_mp", level.RNG_NORMAL);
```
<hr>

#### ``createAmmo(<id>, <model>, <sound>, <icon>, <count>, <rng>)``
Create ammo.

**Parameters:**
* id: Ammo id.
* model: Ammo model.
* sound: Pickup sound allias.
* icon: Icon material.
* count: Clip size.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
battleroyale\game\_api::createAmmo("5_45", "sr_5_45", "amunition", "hud_icon_mag_5_56", 30, level.RNG_NORMAL);
```
<hr>

#### ``createGrenade(<id>, <sound>, <icon>, <weapon>, <rng>)``
Create a grenade.

**Parameters:**
* id: Grenade id.
* sound: Pickup sound allias.
* icon: Icon material.
* weapon: Weapon item id.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
battleroyale\game\_api::createGrenade("frag_grenade", "grenade_pickup", "hud_icon_grenade", "frag_grenade_mp", level.RNG_SMALL);
```
<hr>

#### ``createSpecial(<id>, <model>, <sound>, <icon>, <rng>)``
Create a special.

**Parameters:**
* id: Special id.
* model: Special model.
* sound: Pickup sound allias.
* icon: Icon material.
* rng: Integer from 1 to 10 (higher is more rare).

Usage Example:
```c
battleroyale\game\_api::createSpecial("bandage", "sr_bandage", "health_pickup_large", "hud_icon_band", level.RNG_NORMAL);
```
<hr>
