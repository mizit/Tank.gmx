event_inherited();
if (!keyboard_check(vk_space))
{
	draw_set_color(c_white);
	draw_circle(x, y, 15, 1);
	if (owner)
	{
		draw_line(x, y, owner.x, owner.y);
	}
}