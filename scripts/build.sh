#!/bin/bash
source .cod4env

# Cleanup
cd "$MOD"
rm -v _images.iwd
rm -v _sounds.iwd
rm -v _weapons.iwd
rm -v mod.ff
cp -rv maps/mp/gametypes "$GAME/raw/maps/mp"

# IWDs
cd "$MOD/assets"
7z a -r -tzip "$MOD/_images.iwd" images
7z a -r -tzip "$MOD/_sounds.iwd" sound
7z a -r -tzip "$MOD/_weapons.iwd" weapons

# Assets
cd "$MOD/assets"
cp -v mod.csv "$GAME/zone_source"
cp -rv animtrees "$GAME/raw"
cp -v configs/* "$GAME/raw"
cp -rv english "$GAME/raw"
cp -rv fx "$GAME/raw"
cp -rv images "$GAME/raw"
cp -rv material_properties "$GAME/raw"
cp -rv materials "$GAME/raw"
cp -rv info "$GAME/raw"
cp -rv mp "$GAME/raw"
cp -rv rumble "$GAME/raw"
cp -rv soundaliases "$GAME/raw"
cp -rv sound "$GAME/raw"
cp -rv deffiles "$GAME"
cp -rv shader_bin "$GAME/raw"
cp -rv techniques "$GAME/raw"
cp -rv techsets "$GAME/raw"
cp -v techsets/* "$GAME/raw/techsets/sm2"
cp -rv ui "$GAME/raw"
cp -rv ui_mp "$GAME/raw"
cp -rv weapons "$GAME/raw"
cp -rv vision "$GAME/raw"
cp -rv xanim "$GAME/raw"
cp -rv xmodel "$GAME/raw"
cp -rv xmodelparts "$GAME/raw"
cp -rv xmodelsurfs "$GAME/raw"

# Compile
cd "$GAME/bin"
./linker_pc -language english -compress -cleanup mod
cp -v "$GAME/zone/english/mod.ff" "$MOD/mod.ff"
