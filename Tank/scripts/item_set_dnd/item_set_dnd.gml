/// @description control drag an drop system
/// @param id item
/// @param dragged
/// @param cursor state

var l_item = argument0;
var l_dragged = argument1;
var l_state = argument2;

if (l_dragged)
{
	with (obj_menu_item)
	{
		item_set_dnd(id, 0, CURSOR_STATE.FREE);
	}
	l_item.visible = 1;
	l_item.dnd = 1;
	if (l_item.owner != noone)
	{
		if (ds_exists(l_item.owner, ds_type_list))
		{
			ds_list_delete_value(l_item.owner, l_item);
			if (l_item.owner == hold_list)
			{
				with (obj_menu_eng)
				{
					ds_list_delete_value(stock_list, l_item);
				}
			}
		}
		else
		{
			energy_arr[item_owners_energy_pos(l_item.owner)] = noone;
		}
	}
}
else
{
	if (l_item.dnd == 0)
	{
		return;
	}
	l_item.visible = 0;
	l_item.dnd = 0;
	switch (l_state)
	{
		case CURSOR_STATE.FREE:
		{
			ds_list_add(hold_list, l_item);
			l_item.owner = hold_list;
			with(obj_menu_eng)
			{
				ds_list_add(stock_list, l_item);
			}
			break;
		}
		case CURSOR_STATE.CONSTRUCT:
		{
			if (ds_list_size(construct_list) < stack_max_size) && (l_item.type == TYPE.CONSTRUCT)
			{
				ds_list_add(construct_list, l_item);
				l_item.owner = construct_list;
			}
			else
			{
				ds_list_add(hold_list, l_item);
				l_item.owner = hold_list;
				with(obj_menu_eng)
				{
					ds_list_add(stock_list, l_item);
				}
			}
			break;
		}
		case CURSOR_STATE.WEAPON:
		{
			if (ds_list_size(weapon_list) < stack_max_size) && (l_item.type == TYPE.WEAPON)
			{
				ds_list_add(weapon_list, l_item);
				l_item.owner = weapon_list;
			}
			else
			{
				ds_list_add(hold_list, l_item);
				l_item.owner = hold_list;
				with(obj_menu_eng)
				{
					ds_list_add(stock_list, l_item);
				}
			}
			break;
		}
		case CURSOR_STATE.SUPPORT:
		{
			if (ds_list_size(support_list) < stack_max_size) && (l_item.type == TYPE.SUPPORT)
			{
				ds_list_add(support_list, l_item);
				l_item.owner = support_list;
			}
			else
			{
				ds_list_add(hold_list, l_item);
				l_item.owner = hold_list;
				with(obj_menu_eng)
				{
					ds_list_add(stock_list, l_item);
				}
			}
			break;
		}
		case CURSOR_STATE.STOCK:
		{
			ds_list_add(hold_list, l_item);
			l_item.owner = hold_list;
			with(obj_menu_eng)
			{
				var l_pos = min(ds_list_size(stock_list), floor((window_mouse_get_x() - (c_x + (stock_lt_x + stock_pos) * mult)) / (stock_delta * mult)));
				ds_list_insert(stock_list, l_pos, l_item);
			}
			break;
		}
		case CURSOR_STATE.ENERGY:
		{
			if (l_item.type == TYPE.ENERGY)
			{
				with (obj_menu_eng)
				{
					var l_pos = 1;
					if (mouse_y < energy_edge1_y)
					{
						l_pos = 0;
					}
					if (mouse_y > energy_edge2_y)
					{
						l_pos = 2;
					}
					energy_arr[l_pos] = l_item;
					l_item.owner = item_owners_energy_link(l_pos);
				}
			}
			else
			{
				ds_list_add(hold_list, l_item);
				l_item.owner = hold_list;
				with(obj_menu_eng)
				{
					ds_list_add(stock_list, l_item);
				}
			}
			break;
		}
	}
}