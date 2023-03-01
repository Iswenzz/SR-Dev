#include sr\utils\_common;
#include sr\sys\_events;

main()
{
	event("spawn", ::onSpawn);
	menu("-1", "save", ::menu_Save);
}

onSpawn()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	if (!isDefined(self.devHuds))
	{
		self.devHuds = [];

		self.devHuds[0] = addTextHud(self, 0, -120, 1, "left", "bottom", 1.4);
		self.devHuds[1] = addTextHud(self, 0, -140, 1, "left", "bottom", 1.4);
		self.devHuds[2] = addTextHud(self, 0, -160, 1, "left", "bottom", 1.4);
		self.devHuds[3] = addTextHud(self, 0, -180, 1, "left", "bottom", 1.4);
		self.devHuds[4] = addTextHud(self, 0, -100, 1, "left", "bottom", 1.4);

		for (i = 0; i < self.devHuds.size; i++)
		{
			self.devHuds[i].horzAlign = "left";
			self.devHuds[i].vertAlign = "bottom";
		}
		self.devHuds[4] setText("^5melee^7 spawn trig\n^5attack^7 select trigger \n^5use^7 +5width\n^5frag^7 +5 height\n^5offhand^7 toggle solid\n^5\\openscriptmenu -1 save ^7save selected trigger");
	}

	self.selectedTrigger = undefined;
	while (self.sessionstate == "playing")
	{
		wait 0.5;
		if (self meleeButtonPressed())
		{
			self.selectedTrigger = self placeTrigger(self.origin, 10, 10, 0);
			iprintln("trigger placed");
		}
		if (self attackButtonPressed())
		{
			ents = getEntArray("trigger_radius", "classname");
			for (i = 0; i < ents.size; i++)
			{
				if (distance(ents[i].origin, self.origin) < 32)
				{
					self.selectedTrigger = ents[i];
					iPrintLnBold("selected trigger " + self.selectedTrigger getEntityNumber());
					break;
				}
			}
		}
		if (!isDefined(self.selectedTrigger))
		{
			self.devHuds[0] setText("Trigger not selected");
			for (i = 1; i < self.devHuds.size - 1; i++)
				self.devHuds[i] setText(" ");
			continue;
		}
		if (self secondaryOffhandButtonPressed())
		{
			if (self.selectedTrigger.solid)
				self.selectedTrigger.solid = 0;
			else
				self.selectedTrigger.solid = 1;

			iprintln("Solid: " + self.selectedTrigger.solid);
			continue;
		}
		if (self useButtonPressed())
		{
			width = self.selectedTrigger.width+5;
			height = self.selectedTrigger.height;
			origin = self.selectedTrigger.origin;
			solid = self.selectedTrigger.solid;
			self.selectedTrigger delete();
			self.selectedTrigger = self placeTrigger(origin, width, height, solid);
		}
		if (self fragButtonPressed())
		{
			width = self.selectedTrigger.width;
			height = self.selectedTrigger.height + 5;
			origin = self.selectedTrigger.origin;
			solid = self.selectedTrigger.solid;
			self.selectedTrigger delete();
			self.selectedTrigger = self placeTrigger(origin, width, height, solid);
		}
		self.devHuds[0] setText("Selected: " + self.selectedTrigger getEntityNumber());
		self.devHuds[1] setText("Width: " + self.selectedTrigger.width);
		self.devHuds[2] setText("Height: " + self.selectedTrigger.height);
		self.devHuds[3] setText("Origin: " + self.selectedTrigger.origin);
	}
}

menu_Save(arg)
{
	trigger = self.selectedTrigger;

	origin = trigger.origin;
	width = trigger.width;
	height = trigger.height;
	solid = trigger.solid;

	if (!isDefined(trigger))
		return;

	logPrint("trigger = spawn(\"trigger_radius\", " + origin + ", 0, " + width + ", " + height + ");\n");
	if (solid)
		logPrint("trigger setContents(true);\n");

	iPrintLnBold("Saved trigger " + trigger getEntityNumber());
}

placeTrigger(origin, width, height, solid)
{
	ent = spawn("trigger_radius", origin, 0, width, height);
	ent.width = width;
	ent.height = height;
	ent.solid = solid;

	ent thread triggerThink();

	return ent;
}

triggerThink()
{
	num = self getEntityNumber();
	while (isDefined(self))
	{
		print3d(self.origin, "Trig ("+num+")", (1.0, 0.8, 0.5), 1, 0.4);
		print3d(self.origin+(0,0,15), "Width: "+self.width, (0, 0.5, 0), 1, 0.2);
		print3d(self.origin+(0,0,10), "Height: "+self.height, (0, 0.5, 0), 1, 0.2);

		drawCircle(self.origin, self.width, self.height);

		self setContents(self.solid);
		if (self.solid)
			print3d(self.origin+(0,0,20), "SOLID", (0.6, 0, 0), 1, 0.2);
		else
			print3d(self.origin+(0,0,20), "NOT SOLID", (0.6, 0, 0), 1, 0.2);
		wait 0.05;
	}
}

drawCircle(start, radius, height)
{
	points = [];
	r = radius;
	z = start[2];
	idx = 0;

	for (q = 0; q < 2; q++)
	{
		h = start[0];
		k = start[1];
		for (i = 0; i < 360; i++)
		{
			x = h + r*Cos(i);
			y = k - r*Sin(i);
			points[idx] = (x,y,z);
			idx++;
		}
		z += height;
		for (i = 0; i < points.size - 1; i++)
			drawLine(points[i], points[i + 1], (1, 0, 0), false);
	}
}
drawLine(start, end, colour, depth)
{
	line(start, end, colour, depth);
}

addTextHud(who, x, y, alpha, alignX, alignY, fontScale)
{
	if (isPlayer(who))
		hud = newClientHudElem(who);
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}
