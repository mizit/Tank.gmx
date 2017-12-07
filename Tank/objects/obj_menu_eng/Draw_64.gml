event_inherited();
if (surface_exists(surf))
{
	draw_sprite_ext(mount_sprite, -1, c_x, c_y, mult, mult, 0, c_white, 1);
	draw_surface(stock_surf, c_x + stock_lt_x * mult, c_y + stock_lt_y * mult);
	for (var i = 0; i < ds_list_size(construct_list); i++)
	{
		draw_sprite_ext(construct_list[| i].sprite_index, -1, c_x + construct_rb_x * mult - (i + 0.5) * mult * (construct_rb_y - construct_lt_y),
		c_y + construct_rb_y * mult - 0.5 * mult * (construct_rb_y - construct_lt_y), mult * small_mult, mult * small_mult, 0, c_white, 1);
	}
	for (var i = 0; i < ds_list_size(weapon_list); i++)
	{
		draw_sprite_ext(weapon_list[| i].sprite_index, -1, c_x + weapon_rb_x * mult - (i + 0.5) * mult * (weapon_rb_y - weapon_lt_y),
		c_y + weapon_rb_y * mult - 0.5 * mult * (weapon_rb_y - weapon_lt_y), mult * small_mult, mult * small_mult, 0, c_white, 1);
	}
	for (var i = 0; i < ds_list_size(support_list); i++)
	{
		draw_sprite_ext(support_list[| i].sprite_index, -1, c_x + support_rb_x * mult - (i + 0.5) * mult * (support_rb_y - support_lt_y),
		c_y + support_rb_y * mult - 0.5 * mult * (support_rb_y - support_lt_y), mult * small_mult, mult * small_mult, 0, c_white, 1);
	}
	draw_rectangle(c_x + energy_lt_x * mult, c_y + energy_lt_y * mult, c_x + energy_rb_x * mult, c_y + energy_rb_y * mult, 0);
}