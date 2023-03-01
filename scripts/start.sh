#!/bin/bash
source .cod4env

cd "$GAME"
$BIN_START iw3mp +set fs_game "mods\\$NAME" +set logfile 2 +set monkeytoy 0 +set com_introplayed 1 +set developer 1 +set developer_script 1 +set thereisacow 1337 +set g_gametype deathrun +set rcon_password sr_development +rcon login sr_development +devmap mp_dr_darmuhv2
