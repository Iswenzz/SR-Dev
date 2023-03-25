main()
{
	thread stair_plats();
	thread ele_plat();
}

stair_plats()
{
	plats = getEntarray("plats","targetname");
	trig = getent("plat_trig","targetname");
	dist = 16;
	trig waittill("trigger",player);
	trig delete();
	for(i=0;i<plats.size;i++)
		plats[i] movez(dist*(i+1),1);
}

ele_plat()
{
	plat = getent("ele_plat","targetname");
	trig = getent("ele_plat_trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	for(;;)
	{
		plat movez(512,2);
		wait 5;
		plat movez(-512,2);
		wait 5;
	}
}