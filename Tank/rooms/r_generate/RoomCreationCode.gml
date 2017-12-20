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
	energy_arr[i] = noone;
}
globalvar stack_max_size;
stack_max_size = 5;
globalvar energy_max;
globalvar energy_current;
energy_max = 0;
energy_current = 0;
room_goto_next();