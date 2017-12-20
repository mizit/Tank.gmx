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

construct_lt_x = -320;
construct_lt_y = -198;
construct_rb_x = -40;
construct_rb_y = -142;

weapon_lt_x = -320;
weapon_lt_y = -78;
weapon_rb_x = -40;
weapon_rb_y = -22;

support_lt_x = -320;
support_lt_y = 42;
support_rb_x = -40;
support_rb_y = 98;

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

power_max = 0;
power_current = 0;