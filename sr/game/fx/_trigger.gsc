#include sr\utils\_common;
#include sr\utils\_math;

effect(trigger, color)
{
	if (!isDefined(trigger))
		return;

	switch (color)
	{
		case "red":
		case "endtrig":
			color = (1, 0, 0);
			break;
		case "blue":
		case "secret":
			color = (0, 0, 1);
			break;
		case "yellow":
			color = (1, 1, 0);
			break;
		case "darkred":
			color = (0.5, 0, 0);
			break;
		case "purple":
			color = (0.6, 0.2, 1);
			break;
		case "orange":
			color = (1, 0.6, 0);
			break;
		case "green":
			color = (0, 1, 0);
			break;
		case "cyan":
			color = (0, 1, 1);
			break;
		default:
			color = (0, 0.3, 1);
			break;
	}
	if (trigger.classname == "trigger_radius")
	{
		points = trigger circlePoints();
		trigger draw(points, color);
	}
	else
	{
		points = trigger rectanglePoints();
		trigger draw(points, color);
	}
}

draw(points, color)
{
	while (isDefined(self))
	{
		for (i = 0; i < points.size; i++)
		{
			if (i == points.size - 1)
				thread drawLine(points[i], points[0], 0.05, color);
			else
				thread drawLine(points[i], points[i + 1], 0.05, color);
		}
		wait 0.05;
	}
}
