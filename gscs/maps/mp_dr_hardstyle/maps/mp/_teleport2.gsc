	

    main()
    {
     
            entTransporter = getentarray( "b_telea", "targetname" );
     
            if(isdefined(entTransporter))
            {
                    for( i = 0; i < entTransporter.size; i++ )
                            entTransporter[i] thread transporter();
            }
           
    //      entTransporter = getentarray( "enter2", "targetname" );
    //
    //      if(isdefined(entTransporter))
    //      {
    //              for( i = 0; i < entTransporter.size; i++ )
    //                      entTransporter[i] thread transporter();
    //      }
    }
     
    transporter()
    {
            while(true)
            {
                    self waittill( "trigger", player );
                    entTarget = getEnt( self.target, "targetname" );
                    wait 0.1;
                    player setOrigin( entTarget.origin );
                    player setplayerangles( entTarget.angles );
                    wait 0.1;
            }
    }

