main()
{


	// rainfx
	level._effect[ "rain" ]		 				= loadfx( "weather/rain_mp_farm" );
	level._effect[ "lightning" ]			 	= loadfx( "weather/lightning_mp_farm" );


	maps\mp\_fx::loopfx("lightning",(-432, 1176, -362), 10);
	maps\mp\_fx::loopfx("lightning",(192, 3262, -362), 10);
	maps\mp\_fx::loopfx("lightning",(1450, 3714, -362), 10);
	maps\mp\_fx::loopfx("lightning",(1472, -1186, -132), 10);
	maps\mp\_fx::loopfx("lightning",(2324, -1330, -544), 10);
	maps\mp\_fx::loopfx("lightning",(3322, -1010, -544), 10);
	maps\mp\_fx::loopfx("lightning",(3464, 2150, -564), 10);
	maps\mp\_fx::loopfx("lightning",(2294, 5122, -544), 10);
/#	
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_mystic_fx::main();
#/
}
