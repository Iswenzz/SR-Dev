#include sr\sys\_events;

main()
{
	event("map", ::triggers);
}

triggers()
{
	classnames = strTok("trigger_damage;trigger_disk;trigger_friendlychain;trigger_hurt;trigger_lookat;trigger_multiple;trigger_once;trigger_radius;trigger_use;trigger_use_touch", ";");
	for (i = 0; i < classnames.size; i++)
	{
		triggers = getEntArray(classnames[i], "classname");
		for (j = 0; j < triggers.size; j++)
			triggers[j] thread loop();
	}
}

loop()
{
	while (true)
	{
		self waittill("trigger");

		if (isDefined(self.targetname))
			iPrintLnBold("^5Targetname: ^7" + self.targetname);
		if (isDefined(self.target))
			iPrintLnBold("^1Target: ^7" + self.target);

		wait 0.5;
	}
}
