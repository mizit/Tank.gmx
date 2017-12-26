event_inherited();
ds_list_destroy(stock_list);
surface_free(stock_surf);

/*while(ds_list_size(energy_d_dec_list) > 0)
{
	instance_destroy(energy_d_dec_list[| 0]);
	ds_list_delete(energy_d_dec_list, 0);
}
ds_list_destroy(energy_d_dec_list);
while(ds_list_size(energy_d_one_list) > 0)
{
	instance_destroy(energy_d_one_list[| 0]);
	ds_list_delete(energy_d_one_list, 0);
}*/
with (obj_eng_small_digits)
{
	instance_destroy();
}
with(obj_menu_button)
{
	instance_destroy();
}
ds_list_destroy(energy_d_one_list);
surface_free(energy_d_surf);
surface_free(construct_d_surf);
surface_free(weapon_d_surf);
surface_free(support_d_surf);
ds_list_destroy(construct_d_list);
ds_list_destroy(weapon_d_list);
ds_list_destroy(support_d_list);
//ds_list_destroy(construct_list);
//ds_list_destroy(weapon_list);
//ds_list_destroy(support_list);