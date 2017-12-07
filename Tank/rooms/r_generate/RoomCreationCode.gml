globalvar hold_list;
globalvar construct_list;
globalvar weapon_list;
globalvar support_list;
globalvar energy_arr;
hold_list = ds_list_create();
construct_list = ds_list_create();
weapon_list = ds_list_create();
support_list = ds_list_create();
for (var i = 0; i < 3; i++)
{
	energy_arr = noone;
}
globalvar stack_max_size;
stack_max_size = 5;
room_goto_next();