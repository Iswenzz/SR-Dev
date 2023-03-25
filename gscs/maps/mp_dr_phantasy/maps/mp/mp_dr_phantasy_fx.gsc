main()
{

	// ambient fx
	level._effect[ "endgame_fx" ]			 		 = loadfx( "deathrun/endgame_fx" );
	level._effect[ "fx_endgame" ]			 		 = loadfx( "deathrun/fx_endgame" );
	level._effect[ "falling_teddys" ]			     = loadfx( "deathrun/falling_teddys" );

/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_phantasy_fx::main();
#/
}
