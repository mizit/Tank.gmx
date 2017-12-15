cursor_state = CURSOR_STATE.FREE;
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), c_x + stock_lt_x * mult, c_y + stock_lt_y * mult, c_x + stock_rb_x * mult, c_y + stock_rb_y * mult))
{
	cursor_state = CURSOR_STATE.STOCK;
}
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), c_x + construct_lt_x * mult, c_y + construct_lt_y * mult, c_x + construct_rb_x * mult, c_y + construct_rb_y * mult))
{
	cursor_state = CURSOR_STATE.CONSTRUCT;
}
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), c_x + weapon_lt_x * mult, c_y + weapon_lt_y * mult,c_x +  weapon_rb_x * mult, c_y + weapon_rb_y * mult))
{
	cursor_state = CURSOR_STATE.WEAPON;
}
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), c_x + support_lt_x * mult, c_y + support_lt_y * mult, c_x + support_rb_x * mult, c_y + support_rb_y * mult))
{
	cursor_state = CURSOR_STATE.SUPPORT;
}
if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(), c_x + energy_lt_x * mult, c_y + energy_lt_y * mult, c_x + energy_rb_x * mult, c_y + energy_rb_y * mult))
{
	cursor_state = CURSOR_STATE.ENERGY;
}

if (mouse_check_button_pressed(mb_left))
{
	switch (cursor_state)
	{
		case CURSOR_STATE.STOCK:
		{
			var l_pos = floor((window_mouse_get_x() - (c_x + (stock_lt_x + stock_pos) * mult)) / (stock_delta * mult));
			if (l_pos < ds_list_size(stock_list))
			{
				var l_item = stock_list[| l_pos];
				item_set_dnd(l_item, 1, cursor_state);
			}
			break;
		}
		case CURSOR_STATE.CONSTRUCT:
		{
			if (ds_list_size(construct_list) > 0)
			{
				var l_item = construct_list[| ds_list_size(construct_list) - 1];
				item_set_dnd(l_item, 1, cursor_state);
			}
		}
		case CURSOR_STATE.WEAPON:
		{
			if (ds_list_size(weapon_list) > 0)
			{
				var l_item = weapon_list[| ds_list_size(weapon_list) - 1];
				item_set_dnd(l_item, 1, cursor_state);
			}
		}
		case CURSOR_STATE.SUPPORT:
		{
			if (ds_list_size(support_list) > 0)
			{
				var l_item = support_list[| ds_list_size(support_list) - 1];
				item_set_dnd(l_item, 1, cursor_state);
			}
		}
		case CURSOR_STATE.ENERGY:
		{
			var l_pos = 1;
			if (window_mouse_get_y() < c_y + energy_edge1_y * mult)
			{
				l_pos = 0;
			}
			if (window_mouse_get_y() > c_y + energy_edge2_y * mult)
			{
				l_pos = 2;
			}
			if (energy_arr[l_pos] != noone)
			{
				item_set_dnd(energy_arr[l_pos], 1, cursor_state);
			}
		}
	}
}

surface_clear(stock_surf);
surface_set_target(stock_surf);
for (var i = 0; i < ds_list_size(stock_list); i++)
{
	draw_sprite_ext(stock_list[| i].sprite_index, -1, 
	(i * stock_delta + stock_x_offset + stock_pos) * mult, stock_y_offset * mult,
	mult, mult, 0, c_white, 1);
}
surface_reset_target();