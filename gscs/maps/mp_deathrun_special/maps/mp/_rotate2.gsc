main()
{
  _fan = getentarray("rot2","targetname");

   for(i=0; i < _fan.size; i++)
   {
    _fan[i] thread DoMagic();
   }
}

DoMagic()
{
	while(true)
	{
		self rotateYaw(360,3);
		wait (0.9);
	}
}