main()
{
}

/// pridany jump_trig na score a jump_rotor na schazovani
StartFinalRoom( i, place )
{
	rotor = getEnt( "jump_rotor", "targetname" );
	rotor.angles = ( 0,0,0 );

	origin1 = getent( "jump_0", "targetname" );
	origin2 = getent( "jump_1", "targetname" );
	
	iprintlnbold( "The player ^1"+ self.name +"^7 entered the JUMP room." );
	
	activator = undefined;
	if( !place )
	{
		origin1 PlaceSpawnPoint();
		origin2 PlaceSpawnPoint();
		
		activator = GetActivator();
	
		if( !isdefined( activator ) )
			return;
			
		activator SetOrigin( origin1.origin );
		activator SetPlayerAngles( origin1.angles );
		activator TakeAllWeapons();
		activator GiveWeapon( "knife_mp" );
		
		wait 0.01;
		activator SwitchToWeapon( "knife_mp" );
		
		activator LinkTo( level.tempEntity );
		
		ambientPlay("music_knife");
	}
	
	self SetOrigin( origin2.origin );
	self SetPlayerAngles( origin2.angles );
	self TakeAllWeapons();
	self GiveWeapon( "knife_mp" );

	wait 0.01;
	self SwitchToWeapon( "knife_mp" );
	
	self LinkTo( level.tempEntity );
	
	activator endon( "disconnect" );
	activator endon( "death" );
	activator notify( "falling" );
	self endon( "disconnect" );
	self endon( "death" );
	self notify( "falling" );

	iprintlnbold( "Jump and gain XP bonus for last live!" );
	wait 2;
	iprintlnbold( "Start in 3 second!" );
	wait 1;
	iprintlnbold( "Start in 2 second!" );
	wait 1;
	iprintlnbold( "Start in 1 second!" );
	wait 1;
	
	activator unLink();
	self unLink();
	
	self CreateXPHudElement();
	activator CreateXPHudElement();
	
	activator.rotateXP = 0;
	self.rotateXP = 0;
	
	thread MonitorFalling( activator, self );
	
	rotor = getEnt( "jump_rotor", "targetname" );
	startSpeed = 80;
	LastAddedTime = GetTime();
	for( i = 0;;i++ )
	{
		if( GetTime() - LastAddedTime >= 2000 )
		{
			LastAddedTime = GetTime();
			startSpeed += 10;
			
			self.rotateXP += 10;
			self.RotateXPHudElem SetValue( self.rotateXP );
			
			activator.rotateXP += 10;
			activator.RotateXPHudElem SetValue( activator.rotateXP );
		}
		
		rotor RotateYaw( 180, 180/startSpeed );
		wait ((180/startSpeed) - 0.001);
	}
}

MonitorFalling( activator, jumper )
{
	activator endon( "disconnect" );
	activator endon( "death" );
	self endon( "disconnect" );
	self endon( "death" );

	trigger = getEnt( "jump_trig", "targetname" );
	
	trigger waittill( "trigger", player );
	if( player == activator )
		winner = jumper;
	else
		winner = activator;
		
	winner braxi\_rank::giveRankXP( "bonus", winner.rotateXP );
	
	activator notify( "falling" );
	jumper notify( "falling" );
}

CreateXPHudElement()
{
	self.RotateXPHudElem = newClientHudElem(self);
	self.RotateXPHudElem.horzAlign = "center";
	self.RotateXPHudElem.vertAlign = "middle";
	self.RotateXPHudElem.alignX = "center";
	self.RotateXPHudElem.alignY = "middle";
	self.RotateXPHudElem.x = 0;
	self.RotateXPHudElem.y = 40;
	self.RotateXPHudElem.font = "default";
	self.RotateXPHudElem.fontscale = 3.0;
	self.RotateXPHudElem.archived = false;
	self.RotateXPHudElem.color = (1,1,0.5);
	
	self.RotateXPHudElem SetValue( 0 );
}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return undefined;
}