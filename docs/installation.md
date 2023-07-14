# Installation

![](https://i.imgur.com/S19WOb2.png)

Download the latest version of [**SR-Dev**](https://github.com/Iswenzz/SR-Dev/releases) then extract the folder to ``cod4/mods`` directory. Make a shortcut of **iw3mp.exe** from the cod4 folder to your desktop and name this shortcut **SR-Dev**

Right click on the shortcut and go to properties and edit the target box from:
```
"D:\Program Files (x86)\Activision\Cod4Mod\iw3mp.exe"
```

To this:
```
"D:\Program Files (x86)\Activision\Cod4Mod\iw3mp.exe" +set fs_game "mods\sr_dev" +set logfile 2 +set monkeytoy 0 +set com_introplayed 1 +set developer 1 +set developer_script 1 +set thereisacow 1337 +set g_gametype "deathrun" +set rcon_password sr_development +rcon login sr_development
```

Run the shortcut, open the console and **/devmap <mapname>** to load a map.
