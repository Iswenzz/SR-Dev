# Defrag

The default weapons on all maps are:
* Rocket (gl_ak47_mp)
* Plasma (gl_g3_mp)

#### ``weapons(<list>)``
Set the defrag default weapons on spawn seperated by a ";".

Usage Example:
```c
sr\api\_defrag::weapons("gl_ak47_mp;gl_g3_mp;");
```
<hr>

#### ``perks(<list>)``
Set the defrag default perks on spawn seperated by a ";".

Usage Example:
```c
sr\api\_defrag::perks("haste;");
```
<hr>

#### ``triggerSection(<id>, <origin>, <width>, <height>, <callback>)``
Create a defrag trigger section.

**Parameters:**
* id: The section ID.
* origin: The trigger origin.
* width: The trigger width.
* height: The trigger height.
* callback: The callback called on trigger.

Usage Example:
```c
sr\api\_defrag::triggerSection("section_1", (0, 0, 0), 150, 100, ::section1);
```
<hr>

#### ``triggerWeapon(<id>, <origin>, <width>, <height>, <weapon>, <?ammo>)``
Create a defrag weapon trigger.

**Parameters:**
* id: The section ID.
* origin: The trigger origin.
* width: The trigger width.
* height: The trigger height.
* weapon: The defrag weapon.
* ammo: The weapon ammos, if not specified will give the max ammo.

Usage Example:
```c
sr\api\_defrag::triggerWeapon("rocket_1", (0, 0, 0), 150, 100, "gl_ak47_mp", 4);
```
<hr>

#### ``triggerPerk(<id>, <origin>, <width>, <height>, <perk>, <?time>)``
Set the defrag default perks on spawn seperated by a ";".

**Parameters:**
* id: The section ID.
* origin: The trigger origin.
* width: The trigger width.
* height: The trigger height.
* perk: The perk.
* time: The time the perk last, if not specified it will last forever.

Usage Example:
```c
sr\api\_defrag::triggerPerk("haste_1", (0, 0, 0), 150, 100, "haste", 4);
```
<hr>

#### ``switchToDefragWeapon(<name>)``
Switch to a defrag weapon.

Usage Example:
```c
player sr\api\_defrag::switchToDefragWeapon("gl_ak47_mp");
```
<hr>

#### ``takeDefragWeapon(<name>)``
Take off a defrag weapon.

Usage Example:
```c
player sr\api\_defrag::takeDefragWeapon("gl_ak47_mp");
```
<hr>

#### ``takeAllPerks()``
Take off all perks.

Usage Example:
```c
player sr\api\_defrag::takeAllPerks();
```
<hr>

#### ``takeDefragPerk(<id>)``
Take off a defrag perk.

Usage Example:
```c
player sr\api\_defrag::takeDefragPerk("haste");
```
<hr>

#### ``giveDefragWeapon(<name>, <?ammo>)``
Give a defrag weapon with specific ammo.
If the ammo parameter is not specified it will give the max ammo.

Usage Example:
```c
player sr\api\_defrag::giveDefragWeapon("gl_ak47_mp", 4);
```
<hr>

#### ``giveDefragPerk(<id>, <?time>)``
Give a defrag perk.
If the time parameter is not specified the perk will last forever.

Usage Example:
```c
player sr\api\_defrag::giveDefragPerk("haste", 4);
```
<hr>
