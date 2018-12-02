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

for (var i = 0; i < 6; i++)
{
	if (point_in_rectangle(window_mouse_get_x(), window_mouse_get_y(),
	btn[i].x, btn[i].y - btn[i].sprite_yoffset, btn[i].x + btn[i].sprite_width, 
	btn[i].y - btn[i].sprite_yoffset + btn[i].sprite_height)) && mouse_check_button_pressed(mb_left)
	{
		if (script_exists(btn[i].script))
		{
			script_execute(btn[i].script);
		}
	}
}

//Управление позицией предметов в трюме
if (mouse_wheel_up())
{
	switch(cursor_state)
	{
		case CURSOR_STATE.STOCK:
		{
			stock_step_speed -= stock_step_wheel;
			break;
		}
	}
}

if (mouse_wheel_down())
{
	switch(cursor_state)
	{
		case CURSOR_STATE.STOCK:
		{
			stock_step_speed += stock_step_wheel;
			break;
		}
	}
}
stock_step_speed = friction_manual(stock_step_speed, stock_step_friction);
stock_pos += stock_step_speed;
if (stock_pos >= 0)
{
	stock_step_speed = 0;
	stock_pos = 0;
}
var stock_length = ds_list_size(stock_list) * stock_delta;
if (stock_pos <= ((stock_rb_x - stock_lt_x) - stock_length))
{
	stock_step_speed = 0;
	stock_pos = (stock_rb_x - stock_lt_x) - stock_length;
}

//Обработка нажатия левой кнопки мыши
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


//draw stock
surface_clear(stock_surf);
surface_set_target(stock_surf);
for (var i = 0; i < ds_list_size(stock_list); i++)
{
	draw_sprite_ext(stock_list[| i].sprite_index, -1, 
	(i * stock_delta + stock_x_offset + stock_pos) * mult, stock_y_offset * mult,
	mult, mult, 0, c_white, 1);
}
surface_reset_target();

///Energy cards
if (keyboard_check_pressed(vk_up))
{
	energy_current++;
}
if (keyboard_check_pressed(vk_down))
{
	energy_current = max(0, energy_current - 1);
}

//Отрисовка цифр для отображения запаса энергии
if (floor(energy_current / 10) > floor(energy_digital / 10))
{
	energy_digital += 10;
	var tmp = instance_create_depth(- energy_d_plan_distance, (energy_d_rb_y - energy_d_lt_y) / 2, depth - 1 - ds_list_size(energy_d_dec_list), obj_eng_small_digits);
	tmp.image_index = floor(energy_digital / 10);
	ds_list_add(energy_d_dec_list, tmp);
}

if (floor(energy_current / 10) < floor(energy_digital / 10))
{
	energy_digital -= 10;
	var tmp = energy_d_dec_list[| ds_list_size(energy_d_dec_list) - 1];
	tmp.back = 1;
	ds_list_delete(energy_d_dec_list, ds_list_size(energy_d_dec_list) - 1);
}


if ((energy_current % 10) > (energy_digital % 10))
{
	energy_digital += 1;
	var tmp = instance_create_depth(energy_d_rb_x - energy_d_lt_x + energy_d_plan_distance, (energy_d_rb_y - energy_d_lt_y) / 2, depth - 1 - ds_list_size(energy_d_one_list), obj_eng_small_digits);
	tmp.image_index = (energy_digital % 10);
	tmp.direction = 180;
	ds_list_add(energy_d_one_list, tmp);
}

if ((energy_current % 10) < (energy_digital % 10))
{
	energy_digital -= 1;
	var tmp = energy_d_one_list[| ds_list_size(energy_d_one_list) - 1];
	tmp.back = 1;
	ds_list_delete(energy_d_one_list, ds_list_size(energy_d_one_list) - 1);
}

///Отрисовка цифр энергии в конструкции
if (energy_construct > construct_digital)
{
	construct_digital += 1;
	var tmp = instance_create_depth((construct_d_rb_x - construct_d_lt_x) / 2, -d_plan_distance, depth - 1 - ds_list_size(construct_d_list), obj_eng_digits);
	tmp.image_index = construct_digital;
	tmp.goal_surf = construct_d_surf;
	ds_list_add(construct_d_list, tmp);
}

if (energy_construct < construct_digital)
{
	construct_digital -= 1;
	var tmp = construct_d_list[| ds_list_size(construct_d_list) - 1];
	tmp.back = 1;
	ds_list_delete(construct_d_list, ds_list_size(construct_d_list) - 1);
}

///Отрисовка цифр энергии в орудиях
if (energy_weapon > weapon_digital)
{
	weapon_digital += 1;
	var tmp = instance_create_depth((weapon_d_rb_x - weapon_d_lt_x) / 2, -d_plan_distance, depth - 1 - ds_list_size(weapon_d_list), obj_eng_digits);
	tmp.image_index = weapon_digital;
	tmp.goal_surf = weapon_d_surf;
	ds_list_add(weapon_d_list, tmp);
}

if (energy_weapon < weapon_digital)
{
	weapon_digital -= 1;
	var tmp = weapon_d_list[| ds_list_size(weapon_d_list) - 1];
	tmp.back = 1;
	ds_list_delete(weapon_d_list, ds_list_size(weapon_d_list) - 1);
}

///Отрисовка цифр энергии в поддержке
if (energy_support > support_digital)
{
	support_digital += 1;
	var tmp = instance_create_depth((support_d_rb_x - support_d_lt_x) / 2, -d_plan_distance, depth - 1 - ds_list_size(support_d_list), obj_eng_digits);
	tmp.image_index = support_digital;
	tmp.goal_surf = support_d_surf;
	ds_list_add(support_d_list, tmp);
}

if (energy_support < support_digital)
{
	support_digital -= 1;
	var tmp = support_d_list[| ds_list_size(support_d_list) - 1];
	tmp.back = 1;
	ds_list_delete(support_d_list, ds_list_size(support_d_list) - 1);
}