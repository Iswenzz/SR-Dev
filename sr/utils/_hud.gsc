#include sr\utils\_common;

addHud(who, x, y, alpha, alignX, alignY, fontScale, sort, archived)
{
	if (isPlayer(who))
		hud = newClientHudElem(who);
	else
		hud = newHudElem();

	fontScale = IfUndef(fontScale, 1.4);

	hud.x = x;
	hud.y = y;
	hud.originalAlpha = alpha;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.horzAlign = alignX;
	hud.vertAlign = alignY;
	hud.fontScale = Ternary(fontScale < 1.4, 1.4, fontScale);
	hud.sort = IfUndef(sort, 1);
	hud.archived = IfUndef(archived, false);
	hud.hidewheninmenu = true;
	return hud;
}

getVertical(int)
{
	switch (int)
	{
		case 1:
		case 2:
		case 3:
			return "top";

		case 4:
		case 5:
		case 6:
			return "middle";

		case 7:
		case 8:
		case 9:
			return "bottom";
	}
	return "top";
}

getHorizontal(int)
{
	switch (int)
	{
		case 1:
		case 4:
		case 7:
			return "left";

		case 2:
		case 5:
		case 8:
			return "center";

		case 3:
		case 6:
		case 9:
			return "right";
	}
	return "left";
}

fadeOut(delay, time, direction, speed)
{
	if (!isDefined(self))
		return;
	if (isDefined(direction))
	{
		self moveOverTime(IfUndef(speed, 0.2));

		switch (direction)
		{
			case "top": 	self.y -= 600; 	break;
			case "left": 	self.x -= 600; 	break;
			case "bottom": 	self.y += 600; 	break;
			case "right": 	self.x += 600; 	break;
		}
	}
	wait delay;
	if (!isDefined(self))
		return;

	self fadeOverTime(time);
	self.alpha = 0;

	wait time;
	if (!isDefined(self))
		return;

	self destroy();
}

fadeIn(delay, time, direction, speed)
{
	if (!isDefined(self))
		return;
	if (isDefined(direction))
	{
		switch (direction)
		{
			case "top": 	self.y += 600; 	break;
			case "left": 	self.x += 600; 	break;
			case "bottom": 	self.y -= 600; 	break;
			case "right": 	self.x -= 600; 	break;
		}

		self moveOverTime(IfUndef(speed, 0.2));

		switch (direction)
		{
			case "top": 	self.y -= 600; 	break;
			case "left": 	self.x -= 600; 	break;
			case "bottom": 	self.y += 600; 	break;
			case "right": 	self.x += 600; 	break;
		}
	}
	alpha = self.alpha;
	self.alpha = 0;

	wait delay;
	if (!isDefined(self))
		return;

	self fadeOverTime(time);
	self.alpha = alpha;
}
