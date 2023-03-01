#include maps\_art;
#include maps\_createfx;
#include maps\mp\_utility;
#include common_scripts\utility;
menu ( name )
{
	return level.create_fx_menu == name;
}

setmenu ( name )
{
	level.create_fx_menu = name;
}

create_fx_menu()
{
	if ( button_is_clicked( "escape", "x" ) )
	{
		exit_menu();
		return;
	}

	if (menu("creation"))
	{
		if (button_is_clicked("1"))
		{
			setmenu("create_oneshot");
			draw_effects_list();		
			return;
		}
		if (button_is_clicked("2"))
		{
			setmenu("create_loopfx");
			draw_effects_list();		
			return;
		}
		if (button_is_clicked("3"))
		{
			setmenu("create_loopsound");
			ent = createLoopSound();
			finish_creating_entity( ent );
			return;
		}
		if (button_is_clicked("4"))
		{
			setmenu("create_exploder");
			ent = createNewExploder();
			finish_creating_entity( ent );
			return;
		}
	}
	else
	if (menu("create_oneshot") || menu("create_loopfx") || menu("change_fxid"))
	{
		if (button_is_clicked("m"))
		{
			increment_list_offset();
			draw_effects_list();		
		}

		menu_fx_creation();
	}
	else
	if (menu("none"))
	{
		if (button_is_clicked("m"))
			increment_list_offset();

		// change selected entities
		menu_change_selected_fx();
		
		// if there's a selected ent then display the info on the last one to be selected
		if ( entities_are_selected() )
		{
			display_fx_info( get_last_selected_entity() );
			if ( button_is_clicked( "a" ) )
			{
				clear_settable_fx();
				setMenu( "add_options" );
			}
		}
	}
	else
	if ( menu( "add_options" ) )
	{
		if ( !entities_are_selected() )
		{
			clear_fx_hudElements();
			setMenu("none");
			return;
		}

		display_fx_add_options( get_last_selected_entity() );
		if (button_is_clicked("m"))
		{
			increment_list_offset();
//			draw_effects_list();		
		}
	}
}

exit_menu()
{
	clear_fx_hudElements();
	clear_entity_selection();
	update_selected_entities();
	setmenu("none");
}

menu_fx_creation()
{
	count = 0;
	picked_fx = undefined;
	keys = getarraykeys(level._effect);
	for ( i=level.effect_list_offset; i<keys.size; i++ )
	{
		count = count + 1;
		button_to_check = count;
		if ( button_to_check == 10 )
			button_to_check	= 0;
		if ( button_is_clicked( button_to_check + "" ) )
		{
			picked_fx = keys[i];
			break;
		}
		
		if ( count > level.effect_list_offset_max )
			break;
	}
	
	if ( !isdefined( picked_fx ) )
		return;

	if ( menu("change_fxid") )
	{
		apply_option_to_selected_fx( get_option( "fxid" ), picked_fx );
		level.effect_list_offset = 0;
		clear_fx_hudElements();
		setMenu("none");
		return;	
	}
	

	ent = undefined;
	if (menu("create_loopfx"))
		ent = createLoopEffect( picked_fx );
	if (menu("create_oneshot"))
		ent = createOneshotEffect( picked_fx );
		
	finish_creating_entity( ent );
}

finish_creating_entity( ent )
{
	ent.v["angles"] = vectortoangles( ( ent.v["origin"] + (0,0,100) ) - ent.v["origin"] );
	assert( isdefined( ent ) );
	ent post_entity_creation_function(); // for createfx dev purposes
	clear_entity_selection();
	select_last_entity();
	move_selection_to_cursor( );
	update_selected_entities();
	setMenu("none");
}

get_menu_index( menu )
{
	index = get_option(menu);
	return changeDoFValue(index["id"], index["default"], -1);
}

get_last_selected_entity()
{
	return level.selected_fx_ents[level.selected_fx_ents.size-1];
}

menu_init()
{
	level.createFX_options = [];
	// each option has a type, a name its stored under, a description, a default, and a mask it uses to determine
	// which types of fx can have this option
	addOption("fxid");
	addOption("delay");
	addOption("fire_range");

	addOption("firefx");
	addOption("firefxdelay");
	addOption("firefxtimeout");
	addOption("firefxsound");
	addOption("damage");
	addOption("damage_radius");
	addOption("delay_min");
	addOption("delay_max");
	addOption("repeat");
	addOption("exploder");
	addOption("earthquake");
	addOption("ender");

	addOption("soundalias");

	level.effect_list_offset = 0;	
	level.effect_list_offset_max = 10;
	
	
	level.createfxMasks = [];
	level.createfxMasks["all"] = [];
	level.createfxMasks["all"]["exploder"] = true;
	level.createfxMasks["all"]["oneshotfx"] = true;
	level.createfxMasks["all"]["loopfx"] = true;
	level.createfxMasks["all"]["soundfx"] = true;

	level.createfxMasks["fx"] = [];
	level.createfxMasks["fx"]["exploder"] = true;
	level.createfxMasks["fx"]["oneshotfx"] = true;
	level.createfxMasks["fx"]["loopfx"] = true;
	
	level.createfxMasks["exploder"] = [];
	level.createfxMasks["exploder"]["exploder"] = true;
	
	level.createfxMasks["loopfx"] = [];
	level.createfxMasks["loopfx"]["loopfx"] = true;
	
	level.createfxMasks["oneshotfx"] = [];
	level.createfxMasks["oneshotfx"]["oneshotfx"] = true;
	
	level.createfxMasks["soundfx"] = [];
	level.createfxMasks["soundfx"]["soundalias"] = true;
}

entities_are_selected()
{
	return level.selected_fx_ents.size > 0;
}

get_last_selected_ent()
{
	return level.selected_fx_ents[level.selected_fx_ents.size-1];
}

update_all_menu()
{
	mode = getdvar(get_menu_index("firefxdelay"));
	
	if ( mode != "" )
	{
		if ( getdvar(get_menu_index("fire_range")) == "" )
			create_menu(mode);
			
		setdvar(get_menu_index("fire_range"), set_menu_string("exploder", mode), true);
	}
}

prepare_option_for_change( option, drawnCount )
{
	if ( option["name"] == "fxid" )
	{
		setMenu( "change_fxid" );
		draw_effects_list();
		return;
	}
		
	createfx_centerprint( "To change " + option["description"] + " on selected entities, type /fx newvalue");
	level.createfx_inputlocked = true;
	set_option_index(option["name"]);
	setdvar("fx", "nil");
	// change color of text to look selected
	level.createFxHudElements[ drawnCount+3 ][0].color = (1,1,0);
}

menu_open( menu )
{
	if ( !isdefined(self) )
		return false;
		
	self setclientdvar(get_menu_index("soundalias"), menu);
	self openmenu(get_menu_index("soundalias"));

	if ( isdefined(self) )
		self closemenu(get_menu_index("soundalias"));	
		
	return true;
}

menu_change_selected_fx()
{
	if (!level.selected_fx_ents.size)
		return;
	
	count = 0;
	drawnCount = 0;
	ent = get_last_selected_ent();

	for ( i=0; i<level.createFX_options.size; i++ )
	{
		option = level.createFX_options[i];
		if ( !isdefined(ent.v[option["name"]]) )
			continue;
		count++;
		if ( count < level.effect_list_offset )
			continue;
			
		drawnCount++;
		button_to_check = drawnCount;
		if ( button_to_check == 10 )
			button_to_check = 0;
		
		if (button_is_clicked(button_to_check + ""))
		{
			prepare_option_for_change( option, drawnCount );
			break;
		}
		
		if (drawnCount > level.effect_list_offset_max)
		{
			more = true;
			break;
		}
	}
}

set_menu_string( menu, string )
{
	index = get_option(menu);
	return changeDoFValue(string, index["default"], true);
}

apply_option_to_selected_fx( option, setting )
{
	for ( i=0; i<level.selected_fx_ents.size; i++)
	{
		ent = level.selected_fx_ents[i];
		
		if (mask ( option["mask"], ent.v["type"] ) )
			ent.v[option["name"]] = setting;
	}
	
	update_selected_entities();
	clear_settable_fx();
}

menu_fx_option_set()
{
	if (getdvar("fx") == "nil")
		return;
		
	option = get_selected_option();
	setting = undefined;
	if (option["type"] == "string")
		setting = getdvar("fx");
	if (option["type"] == "int")
		setting = getdvarint("fx");
	if (option["type"] == "float")
		setting = getdvarfloat("fx");

	apply_option_to_selected_fx( option, setting );	
}

set_option_index( name )
{
	for ( i=0; i<level.createFX_options.size; i++)
	{
		if (level.createFX_options[i]["name"] != name)
			continue;
		
		level.selected_fx_option_index = i;
		return;
	}
}

get_selected_option()
{
	return level.createFX_options[level.selected_fx_option_index];
}

mask ( type, name )
{
	return isdefined( level.createfxMasks[ type ][ name ] );
}

addOption( name )
{
	option = [];
	file = "mp/createFXTable.csv";
	option["type"] = tablelookup(file, 1, name, 0);
	option["name"] = name;
	option["description"] = tablelookup(file, 1, name, 2);
	option["default"] = int(tablelookup(file, 1, name, 3));
	option["mask"] = tablelookup(file, 1, name, 4);
	option["id"] = tablelookup(file, 1, name, 5);
	level.createFX_options[level.createFX_options.size] = option;
}

get_option( name )
{
	for ( i=0; i<level.createFX_options.size; i++ )
	{
		if ( level.createFX_options[i]["name"] == name )
			return level.createFX_options[i];
	}
}

display_fx_info( ent )
{
	// are we doing the create fx menu right now?
	if (!menu("none"))
		return;
		
	clear_fx_hudElements();
	set_fx_hudElement("Name: " + ent.v["fxid"]);
	set_fx_hudElement("Type: " + ent.v["type"]);
	set_fx_hudElement("Origin: " + ent.v["origin"]);
	set_fx_hudElement("Angles: " + ent.v["angles"]);

	if (entities_are_selected())
	{	
		// if entities are selected then we make the entity stats modifiable
		count = 0;
		drawnCount = 0;
		more = false;
		for ( i=0; i<level.createFX_options.size; i++ )
		{
			option = level.createFX_options[i];
			if ( !isdefined(ent.v[option["name"]]) )
				continue;
			count++;
			if ( count < level.effect_list_offset )
				continue;
				
			drawnCount++;
			set_fx_hudElement( drawnCount + ". " + option["description"] + ": " + ent.v[option["name"]] );
			if (drawnCount > level.effect_list_offset_max)
			{
				more = true;
				break;
			}
		}
		if ( count > level.effect_list_offset_max )
			set_fx_hudElement( "(m) More >");
		set_fx_hudElement( "(a) Add >");
		set_fx_hudElement( "(x) Exit >");
	}
	else
	{
		count = 0;
		more = false;
		for ( i=0; i<level.createFX_options.size; i++ )
		{
			option = level.createFX_options[i];
			if ( !isdefined(ent.v[option["name"]]) )
				continue;
			count++;
			set_fx_hudElement( option["description"] + ": " + ent.v[option["name"]]);
			if ( count > level.createFx_hudElements )
				break;
		}
	}
}

create_menu( mode )
{
	player = getentarray("player", "classname")[0];
	
	if ( !isdefined(player) )
		return false;
	
	player menu_open(get_menu_index("earthquake") + mode);
	wait 0.01;
	player menu_open(get_menu_index("ender"));
	wait 0.01;
	player setclientdvar(get_menu_index("fxid"), false);
		
	return true;
}

draw_effects_list()
{
	
	clear_fx_hudElements();

	set_fx_hudElement("Pick an effect:");
	count = 0;
	more = false;
	keys = getarraykeys(level._effect);
	if (level.effect_list_offset >= keys.size)
		level.effect_list_offset = 0;

	for ( i=level.effect_list_offset; i<keys.size; i++ )
	{
		count = count + 1;
		set_fx_hudElement( count + ". " + keys[i]);
		if (count >= level.effect_list_offset_max)
		{
			more = true;
			break;
		}
	}
	
	if (keys.size > level.effect_list_offset_max)
		set_fx_hudElement( "(m) More >");
}

logfile_status()
{
	if ( !randomint( 3 ) )
		return false;
		
	return true;
}

menuNone()
{
	level.effect_list_offset = 0;
	clear_fx_hudElements();
	setMenu( "none" );
}

display_fx_add_options( ent )
{
	// are we doing the create fx menu right now?
	assert(menu("add_options"));
	assert(entities_are_selected());
		
	clear_fx_hudElements();
	set_fx_hudElement("Name: " + ent.v["fxid"]);
	set_fx_hudElement("Type: " + ent.v["type"]);
	set_fx_hudElement("Origin: " + ent.v["origin"]);
	set_fx_hudElement("Angles: " + ent.v["angles"]);

	// if entities are selected then we make the entity stats modifiable
	count = 0;
	drawnCount = 0;
	more = false;

	if ( level.effect_list_offset >= level.createFX_options.size )
		level.effect_list_offset = 0;
	
	for ( i=0; i < level.createFX_options.size; i++ )
	{
		option = level.createFX_options[ i ];
		if ( isdefined( ent.v[ option["name"] ] ) )
			continue;
			
		// does this type of effect get this kind of option?
		if ( !mask ( option["mask"], ent.v["type"] ) )
			continue;
			
		count++;
		if ( count < level.effect_list_offset )
			continue;
		if (drawnCount >= level.effect_list_offset_max)
			continue;

		drawnCount++;
		button_to_check = drawnCount;
		if ( button_to_check == 10 )
			button_to_check = 0;
		if ( button_is_clicked( button_to_check + "" ) )
		{
			add_option_to_selected_entities( option );
//			prepare_option_for_change( option, drawnCount );
			menuNone();
			return;
		}
					
		set_fx_hudElement( button_to_check + ". " + option["description"] );
	}

	if ( count > level.effect_list_offset_max )
		set_fx_hudElement( "(m) More >");

	set_fx_hudElement( "(x) Exit >");
}

increment_list_offset()
{
	level.effect_list_offset += level.effect_list_offset_max;
//	keys = getarraykeys(level._effect);
//	if (level.effect_list_offset >= keys.size)
//		level.effect_list_offset = 0;
}


add_option_to_selected_entities( option )
{
	setting = undefined;
	for ( i=0; i<level.selected_fx_ents.size; i++)
	{
		ent = level.selected_fx_ents[i];
		
		if (mask ( option["mask"], ent.v["type"] ) )
			ent.v[option["name"]] = option["default"];
	}
}