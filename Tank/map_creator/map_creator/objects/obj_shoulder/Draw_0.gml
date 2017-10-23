event_inherited();
draw_set_color(c_white);
draw_circle(x, y, 3, 1);
if (owner)
{
	draw_line(x, y, owner.x, owner.y);
}