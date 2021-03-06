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
	for (var i = 0; i < 3; i++)
	{
		if (energy_arr[i] != noone)
		{
			draw_sprite_ext(energy_arr[i].sprite_index, -1, c_x + energy_lt_x * mult + 0.5 * mult * (energy_rb_x - energy_lt_x), 
			c_y + energy_lt_y * mult + i * mult * energy_step + 0.5 * mult * (energy_rb_x - energy_lt_x), mult, mult, 0, c_white, 1);
		}
	}
	draw_surface_ext(energy_d_surf, c_x + energy_d_lt_x * mult, c_y + energy_d_lt_y * mult, mult, mult, 0, c_white, 1);
	draw_surface_ext(construct_d_surf, c_x + construct_d_lt_x * mult, c_y + construct_d_lt_y * mult, mult, mult, 0, c_white, 1);
	draw_surface_ext(weapon_d_surf, c_x + weapon_d_lt_x * mult, c_y + weapon_d_lt_y * mult, mult, mult, 0, c_white, 1);
	draw_surface_ext(support_d_surf, c_x + support_d_lt_x * mult, c_y + support_d_lt_y * mult, mult, mult, 0, c_white, 1);
	//draw_rectangle(c_x + construct_d_lt_x * mult, c_y + construct_d_lt_y * mult, c_x + construct_d_rb_x * mult, c_y + construct_d_rb_y * mult, 0);
	//draw_rectangle(c_x + weapon_d_lt_x * mult, c_y + weapon_d_lt_y * mult, c_x + weapon_d_rb_x * mult, c_y + weapon_d_rb_y * mult, 0);
	//draw_rectangle(c_x + support_d_lt_x * mult, c_y + support_d_lt_y * mult, c_x + support_d_rb_x * mult, c_y + support_d_rb_y * mult, 0);
}
draw_sprite_ext(s_glass, -1, c_x + energy_d_lt_x * mult, c_y  - mult * 220, mult, mult, 0, c_white, 1);