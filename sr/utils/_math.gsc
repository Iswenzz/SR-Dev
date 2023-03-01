#include sr\utils\_common;

vectorScale(vec, scale)
{
	return (vec[0] * scale, vec[1] * scale, vec[2] * scale);
}

drawText(pos, text, time, color, alpha, scale)
{
	time = IfUndef(time, 0) * 20;

	if (!isDefined(color))
		color = randomColorDark();

	for (i = 0; i != time; i++)
	{
		print3D(pos, text, color, alpha, scale);
		wait 0.05;
	}
}

drawPoint(pos, time, color)
{
	time = IfUndef(time, 0) * 20;

	if (!isDefined(color))
		color = randomColorDark();

	lines = [];
	count = 5;

	for (i = 0; i < count * 2; i += 2)
	{
		l = vectorNormalize(randomColor());
		lines[i] = pos - l / 10;
		lines[i + 1] = pos + l / 10;
	}
	for (j = 0; j != time; j++)
	{
		for (i = 0; i < count * 2; i += 2)
			line(lines[i], lines[i + 1], color, true);
		wait 0.05;
	}
}

drawLine(from, to, time, color)
{
	time = IfUndef(time, 0) * 20;

	if (!isDefined(color))
		color = randomColorDark();

	for (i = 0; i != time; i++)
	{
		line(from, to, color, true);
		wait 0.05;
	}
}

drawCircle(start, radius, height, time, color)
{
	time = IfUndef(time, 0) * 20;

	if (!isDefined(color))
		color = randomColorDark();

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
			x = h + r * cos(i);
			y = k - r * sin(i);
			points[idx] = (x, y, z);
			idx++;
		}
		z += height;
	}
	for (i = 0; i != time; i++)
	{
		for (p = 0; p < points.size - 1; p++)
			thread drawLine(points[p], points[p + 1], 0.05, color);
		wait 0.05;
	}
}

drawAxis(pos, time)
{
	time = IfUndef(time, 0) * 20;

	f = anglesToForward(self.angles) * 20;
	r = anglesToRight(self.angles) * -20;
	u = anglesToUp(self.angles) * 20;

	for (i = 0; i != time; i++)
	{
		thread drawLine(pos, pos + f, 0.05, (1, 0, 0));
		thread drawLine(pos, pos + r, 0.05, (0, 0, 1));
		thread drawLine(pos, pos + u, 0.05, (0, 1, 0));

		wait 0.05;
	}
}
