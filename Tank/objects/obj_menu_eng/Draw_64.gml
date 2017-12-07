event_inherited();
if (surface_exists(surf))
{
	draw_sprite_ext(mount_sprite, -1, c_x, c_y, mult, mult, 0, c_white, 1);
	//draw_rectangle(c_x + stock_lt_x * mult, c_y + stock_lt_y * mult, c_x + stock_rb_x * mult, c_y + stock_rb_y * mult, 0);
	draw_surface(stock_surf, c_x + stock_lt_x * mult, c_y + stock_lt_y * mult);
	draw_rectangle(c_x + construct_lt_x * mult, c_y + construct_lt_y * mult, c_x + construct_rb_x * mult, c_y + construct_rb_y * mult, 0);
	draw_rectangle(c_x + weapon_lt_x * mult, c_y + weapon_lt_y * mult, c_x + weapon_rb_x * mult, c_y + weapon_rb_y * mult, 0);
	draw_rectangle(c_x + support_lt_x * mult, c_y + support_lt_y * mult, c_x + support_rb_x * mult, c_y + support_rb_y * mult, 0);
	draw_rectangle(c_x + energy_lt_x * mult, c_y + energy_lt_y * mult, c_x + energy_rb_x * mult, c_y + energy_rb_y * mult, 0);
}
//draw_text(window_mouse_get_x(), window_mouse_get_y(), cursor_state);