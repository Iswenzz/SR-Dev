main()
{
	PreCacheModel( "4gf_special_model_dr" );
	//PreCacheModel( "prop_flag_neutral" );
	level.coinPrice = 3;
	
	//thread AddEndMapBonus();
	
	for(i = 0;i < 7;i++)
		thread MonitorTrapTriggers( i );
}
/*
AddEndMapBonus()
{
	trigger = getent( "trap_c_20", "targetname" );
	origin = getent( "bonus", "targetname" );
	
	trigger waittill( "trigger" );
	
	if( level.mapmode == 1 )
	{
		AddItem( origin.origin, 7, "tag_chest_r" );
		AddItem( origin.origin, 8, "tag_chest_r" );
	}
	else if( level.mapmode == 2 )
		AddItem( origin.origin, 7, "tag_chest_b" );
}
*/
MonitorTrapTriggers( i )
{
	if( !isdefined( level.TrapMonitorTrigger ) )
		level.TrapMonitorTrigger = [];
		
	level.TrapMonitorTrigger[i] = getent( "trap_c_"+i, "targetname" );
	
	while( true )
	{
		level.TrapMonitorTrigger[i] waittill( "trigger", player );
		
		if( !isdefined( player.closedTraps ) )
			player.closedTraps = [];
		
		if( !isdefined( player.closedTraps[i] ) )
		{
			player.closedTraps[i] = SpawnStruct();
			player.closedTraps[i].time = GetTime();
		}
	}
}

AddItem( origin, type, tag )
{
	item = spawn( "script_model", origin );
	
	item.item = type;
	item.constant = true;
	
	item TagSystem( tag );
	
	item thread StartRotate();
	item thread WaitToGrab();
}

AddCoin( trap, price )
{
	if( level.freeRun )
		return;
	
	if( !isdefined( level.TrapsTime ) )
		level.TrapsTime = [];
		
	level.TrapsTime[trap] = GetTime();
	
	players = GetEntArray( "player", "classname" );
	for( i = 0;i < players.size;i++ )
	{
		if( isDefined( players[i] ) && isPlayer( players[i] ) && isAlive( players[i] ) && players[i] IsTouching( level.TrapMonitorTrigger[trap] ) )
		{
			if( !isdefined( players[i].closedTraps ) )
				players[i].closedTraps = [];
		
			if( !isdefined( players[i].closedTraps[trap] ) )
				players[i].closedTraps[trap] = SpawnStruct();
			
			players[i].closedTraps[trap].time = GetTime();
		}
	}
	
	origin = getent( "trap"+trap+"_coin", "targetname" ).origin;
	
	coin = spawn( "script_model", origin );
	
	/*if( level.mapmode == 1 && !RandomInt( 20 ) && !isdefined( level.lastroom ) )
	{
		coin.item = 50;
		coin.constant = true;
		tag = "tag_hardpoint_box";
	}
	else if( level.mapmode == 2 && !RandomInt( 30 ) && !isdefined( level.lastroom ) )
	{
		coin.item = 50;
		coin.constant = true;
		tag = "tag_hardpoint_box";
	}*/
	r = RandomInt( 4 );
	if( r == 0 )
	{
		coin SetRandomItem( trap );
		tag = "tag_random_box";
	}
	else if( r == 1 )
	{
		coin.trap = trap;
		coin.item = 50;
		coin.constant = true;
		tag = "tag_resp_box";
	}
	else
	{
		price = int( price*trap+2 );
		coin.price = price;
		tag = "tag_4gf_coin";
	}
	
	coin TagSystem( tag );
	
	coin thread StartRotate();
	coin thread WaitToGrab( 240, trap );
}

StartRotate()
{
	self endon( "delete" );

	while( 1 )
	{
		self RotateYaw( 360, 5 );
		self waittill( "rotatedone" );
	}
}

WaitToGrab( maxTime, trap )
{
	self endon( "delete" );

	startTime = getTime();
	
	minDist = 64;
	
	while( 1 )
	{
		wait 0.1;
	
		if( isdefined( maxTime ) && (getTime()-startTime)/1000 >= maxTime )
		{
			//iprintln( "delete time" );
			self thread GrabCoin();
		}
		
		players = getentarray( "player", "classname" );
		for(i = 0;i < players.size;i++)
		{
			player = players[i];
			
			if( isdefined( player ) && isplayer( player ) && isalive( player ) )
			{
				if( isdefined( distance( self.origin, player.origin ) ) && distance( self.origin, player.origin ) <= minDist )
				{
					if( isdefined( trap ) && isdefined( player.closedTraps ) && isdefined( player.closedTraps[trap] ) 
					&& isdefined( level.TrapsTime ) && isdefined( level.TrapsTime[trap] ) && ( player.closedTraps[trap].time >= level.TrapsTime[trap] || player IsTouching( level.TrapMonitorTrigger[trap] ) ) )
						self thread GrabCoin( player );
					else if( !isdefined( trap ) )
						self thread GrabCoin( player );
				}
			}
		}
	}
}

GrabCoin( player )
{
	self notify( "delete" );
	//self delete();
	
	if( isdefined( player ) && isplayer( player ) )
	{
		if( isdefined( self.price ) )
		{
			player braxi\_rank::giveRankXP( "coin", self.price );
			iprintlnbold( "Player ^1"+ player.name +"^7 found bonus coin ^1"+ self.price +" ^7XP." );
		}
		else if( isdefined( self.item ) )
		{
			player thread UseItem( self.item, self.origin, self.constant, self.trap );
		}
	}
	
	//iprintln( "coin delete" );
	self delete();
}

TagSystem( tag )
{
	self endon( "delete" );

	self.origin += (0,0,10000);
	self setModel( "4gf_special_model_dr" );

	/*
	? tag_4gf_coin   ( 0.00, 0.00, 0.00)
    ? tag_ammo_box   ( 0.00, 0.00, 0.00)
    ? tag_chest_b   ( 0.00, 0.00, 0.00)
    ? tag_chest_r   ( 0.00, 0.00, 0.00)
    ? tag_hardpoint_box   ( 0.00, 0.00, 0.00)
    ? tag_hp_box   ( 0.00, 0.00, 0.00)
    ? tag_random_box   ( 0.00, 0.00, 0.00)
	*/
	
	tags = [];
	tags[tags.size] = "tag_resp_box"; 
	tags[tags.size] = "tag_chest_b"; // dt bedna modra - finish
	tags[tags.size] = "tag_chest_r"; // dt bedna ruda - finish
	tags[tags.size] = "tag_random_box"; // box s otaznikom - kazda past, 1/5 ze padne -
	tags[tags.size] = "tag_4gf_coin"; // peniaz - normal
	tags[tags.size] = "tag_ammo_box"; // ammo box
	tags[tags.size] = "tag_hp_box"; // lekarnicka
	tags[tags.size] = "tag_hardpoint_box"; // box s lebkou s random HP -

	
	self.tags = tags;
	
	for(i = 0;i < tags.size;i++)
	{
		if( tags[i] != tag)
			self HidePart( tags[i], "4gf_special_model_dr" );
	}
	
	wait 0.001;
	
	self.origin -= (0,0,10000);
}

SetRandomItem( trap )
{
	if( trap <= 0 )
	{
		self.item = 0;
		return;
	}
	
	self.item = RandomInt( trap );
}

UseItem( item, origin, constant, trap )
{
	self endon( "disconnect" );
	self endon( "death" );

	if( !isdefined( constant ) )
	{
		if( RandomInt( 3 ) )
			item = RandomInt( 12 );
	}
	
	switch( item )
	{
		case 0:
			//FinishPlayerDamage( <Inflictor>, <Attacker>, <Damage>, <Damage Flags>, <Means of Death>, <Weapon>, <Direction>, <Hit Loc>, <OffsetTime> )
			PlayFX( level._effect[ "pulse" ], origin );
			
			players = getentarray( "player", "classname" );
			for(i = 0;i < players.size;i++)
			{
				player = players[i];
				if( isdefined(player) && isplayer(player) && isalive(player) && player.pers["team"] == "allies" && isdefined( distance( player.origin, origin ) ) && distance( player.origin, origin ) <= 300 )
				{
					i = 0;
					while( isdefined(player) && isplayer(player) && isalive(player) && player.pers["team"] == "allies" && isdefined( distance( player.origin, origin ) ) && distance( player.origin, origin ) <= 300 && i < 10 )
					{
						player.health += 4000000;
						player FinishPlayerDamage( player, player, 4000000, 0, "MOD_PROJECTILE", "rpg_mp", origin, vectornormalize(player.origin - origin), "none", 0);
						wait 0.001;
						i++;
					}
				}
			}
			
			iprintlnbold( "Player ^1"+ self.name +"^7 found ^5ShockBomb^7." );
			break;
		case 1:		
		case 2:
			speed = level.dvar["allies_speed"]*1.2;
			self setMoveSpeedScale( speed );
			iprintlnbold( "Player ^1"+ self.name +"^7 found ^4Speed ^1HACK^7." );
			break;
		case 3:
		case 4:
			checkpoint = origin;
			lifes = self.pers["lifes"];
			self thread CheckPointSystem( checkpoint, lifes );
			
			iprintlnbold( "Player ^1"+ self.name +"^7 found ^2Checkpoint^7." );
			break;
		case 5:
		case 6:
			self braxi\_rank::giveRankXP( "coin", 50 );
			iprintlnbold( "Player ^1"+ self.name +"^7 found ^3XP bonus^7." );
			break;
		case 50:
			if( RandomInt( 2 ) )
				type = 1;
			else
				type = (-1);
				
			if( !isDefined( trap ) )
				return;
			
			trap = trap+type;
			
			if( trap < 0 )
				trap = 0;
			else if( trap > 6 )
				trap = 6;
			
			ent = getEnt( "trap"+trap+"_coin", "targetname" );
			self setOrigin( ent.origin );
			self setPlayerAngles( ent.angles );
			
			tempEnt = spawn( "script_origin", self.origin );
			iprintlnbold( "Player ^1"+ self.name + "^7 use ^4TrapMover!" );
			self LinkTo( tempEnt );
			wait 2;
			self iprintlnbold( "^1!! ^7GO ^1!!" );
			self unLink();
			tempEnt delete();		
			break;
		default:
			self braxi\_mod::giveLife();
			iprintlnbold( "Player ^1"+ self.name +"^7 found ^2Life^7." );
			break;
	}
}

CheckPointSystem( checkpoint, lifes )
{
	self endon( "disconnect" );
	self waittill( "death" );

	lifes = self.pers["lifes"];
	
	self waittill( "spawned_player" );
	
	if( self.pers["lifes"] < lifes )
	{
		self SetOrigin( checkpoint );
		ent = spawn( "script_origin", self.origin );
		
		self iprintlnbold( "Now use the ^1Checkpoint^7." );
		self LinkTo( ent );
		wait 4;
		self iprintlnbold( "^1!! ^7GO ^1!!" );
		self unLink();
		ent delete();
	}
}
