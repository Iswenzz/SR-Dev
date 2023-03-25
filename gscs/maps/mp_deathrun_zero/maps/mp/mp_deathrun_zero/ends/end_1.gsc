main()
{
	BuildRoomInfo();

	for(i = 0;i < level.finalRooms.size;i++)
		thread CheckPlayerActive( i );
}

BuildRoomInfo()
{
	level.finalRooms = [];
	
	for(i = 0;i < 4;i++)
	{
		size = level.finalRooms.size;
		level.finalRooms[size]["trigger"] = getent( "end_"+i+"_t", "targetname" );
		level.finalRooms[size]["billboard"] = getent( "end_"+i+"_b", "targetname" );
	}
}

CheckPlayerActive( i )
{
	trigger = level.finalRooms[i]["trigger"];
	brush = level.finalRooms[i]["billboard"];
	place = 0;
	
	while( true )
	{
		trigger waittill( "trigger", player );
		
		if( place == 0 )
		{
			player SaveMapTime();
		
			for(c = 0;c < level.finalRooms.size;c++)
			{
				if( c == i )
					continue;
			
				level.finalRooms[c]["trigger"] delete();
				level.finalRooms[c]["billboard"] MoveZ( -200, 5 );
			}
		}
		
		player GetRoomFile( i, place );
		place++;
	}
}

// 1 - classic
// 2 - knife
// 3 - snipe
// 4 - jump

GetRoomFile( i, place )
{
	switch( i )
	{
		case 0:
			self maps\mp\mp_deathrun_zero\ends\end_1::StartFinalRoom( i, place );
			break;
		case 1:
			self maps\mp\mp_deathrun_zero\ends\end_2::StartFinalRoom( i, place );
			break;	
		case 2:
			self maps\mp\mp_deathrun_zero\ends\end_3::StartFinalRoom( i, place );
			break;	
		case 3:
			self maps\mp\mp_deathrun_zero\ends\end_4::StartFinalRoom( i, place );
			break;				
	}
}

SaveMapTime() //by PetX
{
	current = gettime();
	start = level.mapStartTime;
	
	time = current-start;
	
	self.pers["time"] = int( time/1000 );
	
	self iprintln( "Your time: ^3"+ int( time/1000 ) );
}

StartFinalRoom( i, place )
{
	level.finalRooms[i]["trigger"] delete();
	level.finalRooms[i]["billboard"] MoveZ( -200, 5 );

	door = getent( "door", "targetname" );
	iprintlnbold( "Player ^1"+ self.name +" ^7select classic way." );
	
	wait 2;
	
	door movex( -200, 4 );
	door playsound("bigdoor");
	ambientPlay("dooropen");
	playFX( level._effect["rachejtle"] , (-840, -1512, 776));
	iprintlnbold ("^2Door opened!!");
}
