/// @description returning y coord of x
/// @param x
/// @return y

var l_x = argument0;
if (instance_exists(obj_free_ground))
{
	var l_lx = ground_nearest(l_x, GROUND_POS.FLOOR);
	var l_rx = l_lx + 1;
	with (obj_free_ground)
	{
		var x1, x2, y1, y2, k, b;
		x1 = dpx[| l_lx];
		x2 = dpx[| l_rx];
		while (x1 == x2)
		{
			l_rx++;
			x2 = dpx[| l_rx];
			if (is_undefined(x1) || is_undefined(x2))
			{
				return 0;
			}
		}
		y1 = dpy[| l_lx];
		y2 = dpy[| l_rx];
		k = (y1 - y2) / (x1 - x2);
		b = y1 - k * x1;
		return (k * l_x + b);
	}
}
else
{
	show_message("Ground doesn't exist.");
}