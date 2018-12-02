event_inherited();
enum CURSOR_STATE
{
	FREE,
	STOCK,
	CONSTRUCT,
	WEAPON,
	SUPPORT,
	ENERGY
}
cursor_state = CURSOR_STATE.FREE;

mult = 1;
mount_sprite = s_menu_eng;

var s_h = sprite_get_height(mount_sprite);
var w_h = surface_get_height(application_surface) - 100;
mult = min(1, w_h / s_h);

dnd = noone;

stock_list = ds_list_create();
for (var i = 0; i < ds_list_size(hold_list); i++)
{
	if (hold_list[| i].type == TYPE.CONSTRUCT) || 
	(hold_list[| i].type == TYPE.WEAPON) ||
	(hold_list[| i].type == TYPE.SUPPORT) ||
	(hold_list[| i].type == TYPE.ENERGY) 
	{
		ds_list_add(stock_list, hold_list[| i]);
	}
}
stock_lt_x = -320;
stock_lt_y = 140;
stock_rb_x = 320;
stock_rb_y = 220;
stock_surf = surface_create((stock_rb_x - stock_lt_x) * mult, (stock_rb_y - stock_lt_y) * mult);
stock_x_offset = sprite_get_width(s_menu_module) / 2 + 5;
stock_y_offset = sprite_get_height(s_menu_module) / 2;
stock_delta = sprite_get_width(s_menu_module) + 5;
stock_pos = 0;
stock_step_wheel = 10;
stock_step_speed = 0;
stock_step_friction = 1;

construct_lt_x = -320;
construct_lt_y = -198;
construct_rb_x = -40;
construct_rb_y = -142;
construct_d_lt_x = -22;
construct_d_lt_y = -205;
construct_d_rb_x = 28;
construct_d_rb_y = -155;
construct_d_surf = surface_create(construct_d_rb_x - construct_d_lt_x, construct_d_rb_y - construct_d_lt_y);
construct_d_list = ds_list_create();
construct_digital = 0;

weapon_lt_x = -320;
weapon_lt_y = -78;
weapon_rb_x = -40;
weapon_rb_y = -22;
weapon_d_lt_x = -22;
weapon_d_lt_y = -85;
weapon_d_rb_x = 28;
weapon_d_rb_y = -35;
weapon_d_surf = surface_create(weapon_d_rb_x - weapon_d_lt_x, weapon_d_rb_y - weapon_d_lt_y);
weapon_d_list = ds_list_create();
weapon_digital = 0;

support_lt_x = -320;
support_lt_y = 42;
support_rb_x = -40;
support_rb_y = 98;
support_d_lt_x = -22;
support_d_lt_y = 35;
support_d_rb_x = 28;
support_d_rb_y = 85;
support_d_surf = surface_create(support_d_rb_x - support_d_lt_x, support_d_rb_y - support_d_lt_y);
support_d_list = ds_list_create();
support_digital = 0;

d_plan_distance = sprite_get_height(s_digit) + 50;

small_mult = (construct_rb_y - construct_lt_y) / sprite_get_height(s_menu_module);

energy_lt_x = 240;
energy_lt_y = -220;
energy_rb_x = 320;
energy_rb_y = 100;
energy_edge1_y = energy_lt_y + 100;
energy_edge2_y = energy_rb_y - 100;
energy_step = 120;

energy_d_lt_x = 120;
energy_d_lt_y = -80;
energy_d_rb_x = 200;
energy_d_rb_y = -40;
energy_d_surf = surface_create(energy_d_rb_x - energy_d_lt_x, energy_d_rb_y - energy_d_lt_y);
energy_digital = 0;
energy_d_dec_list = ds_list_create();
energy_d_one_list = ds_list_create();
energy_d_plan_distance = 35;

btn_x_offset = 37;

btn[0] = instance_create_depth(x + c_x + mult * btn_x_offset, y + c_y - mult * 220, depth - 1, obj_menu_button);
btn[0].script = btn_construct_up;
btn[0].mult = mult;
btn[0].image_xscale = mult;
btn[0].image_yscale = mult;

btn[1] = instance_create_depth(x + c_x + mult * btn_x_offset, y + c_y - mult * 140, depth - 1, obj_menu_button);
btn[1].script = btn_construct_down;
btn[1].mult = mult;
btn[1].sprite_index = s_menu_btn_down;
btn[1].image_xscale = mult;
btn[1].image_yscale = mult;

btn[2] = instance_create_depth(x + c_x + mult * btn_x_offset, y + c_y - mult * 100, depth - 1, obj_menu_button);
btn[2].script = btn_weapon_up;
btn[2].mult = mult;
btn[2].image_xscale = mult;
btn[2].image_yscale = mult;

btn[3] = instance_create_depth(x + c_x + mult * btn_x_offset, y + c_y - mult * 20, depth - 1, obj_menu_button);
btn[3].script = btn_weapon_down;
btn[3].mult = mult;
btn[3].sprite_index = s_menu_btn_down;
btn[3].image_xscale = mult;
btn[3].image_yscale = mult;

btn[4] = instance_create_depth(x + c_x + mult * btn_x_offset, y + c_y + mult * 20, depth - 1, obj_menu_button);
btn[4].script = btn_support_up;
btn[4].mult = mult;
btn[4].image_xscale = mult;
btn[4].image_yscale = mult;

btn[5] = instance_create_depth(x + c_x + mult * btn_x_offset, y + c_y + mult * 100, depth - 1, obj_menu_button);
btn[5].script = btn_support_down;
btn[5].mult = mult;
btn[5].sprite_index = s_menu_btn_down;
btn[5].image_xscale = mult;
btn[5].image_yscale = mult;



power_max = 0;
power_current = 0;