main()
{
  

  
  entteleport = getentarray("teleport2","targetname");
  if(isdefined(entteleport))
  {
    for(lp=0;lp<entteleport.size;lp=lp+1)
      entteleport[lp] thread teleport();
  }
}

teleport()
{
  while(true)
  {
    self waittill("trigger",other);
    entTarget = getent(self.target, "targetname");
    
	wait(0.10);
    other setorigin(entTarget.origin);
    other setplayerangles(entTarget.angles);
	wait(0.10);
  }
}