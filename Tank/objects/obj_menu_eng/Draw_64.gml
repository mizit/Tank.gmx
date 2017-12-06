event_inherited();
if (surface_exists(surf))
{
	var c_x = surface_get_width(surf) / 2;
	var c_y = surface_get_height(surf) / 2;
	draw_sprite_ext(mount_sprite, -1, c_x, c_y, mult, mult, 0, c_white, 1);
	draw_rectangle(c_x + stock_lt_x * mult, c_y + stock_lt_y * mult, c_x + stock_rb_x * mult, c_y + stock_rb_y * mult, 0);
}