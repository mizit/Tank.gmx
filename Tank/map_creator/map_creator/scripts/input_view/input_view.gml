/// @description controlling view
if (mouse_wheel_down())
{
	scale_goal *= (1 + scale_step);
}
if (mouse_wheel_up())
{
	scale_goal *= (1 - scale_step);
}
scale_goal = clamp(scale_goal, scale_min, scale_max);

if (mouse_check_button(mb_middle))
{
	if (!mouse_x_latch)
	{
		mouse_x_latch = window_mouse_get_x();
	}
	if (!mouse_y_latch)
	{
		mouse_y_latch = window_mouse_get_y();
	}
	position_xoffset = (mouse_x_latch - window_mouse_get_x()) * scale_current;
	position_yoffset = (mouse_y_latch - window_mouse_get_y()) * scale_current;
}
else
{
	position_x += position_xoffset;
	position_y += position_yoffset;
	position_xoffset = 0;
	position_yoffset = 0;
	mouse_x_latch = noone;
	mouse_y_latch = noone;
}