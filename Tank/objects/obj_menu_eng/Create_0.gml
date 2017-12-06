event_inherited();
mult = 1;
mount_sprite = s_menu_eng;

var s_h = sprite_get_height(mount_sprite);
var w_h = surface_get_height(application_surface) - 100;
mult = min(1, w_h / s_h);

stack_max_size = 5;

stock_list = ds_list_create();
stock_lt_x = -320;
stock_lt_y = 140;
stock_rb_x = 320;
stock_rb_y = 220;

construct_list = ds_list_create();


weapon_list = ds_list_create();
support_list = ds_list_create();

power_max = 0;
power_current = 0;