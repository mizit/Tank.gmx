while(ds_list_size(beams) > 0)
{
	ds_list_destroy(beams[| 0]);
	ds_list_delete(beams, 0);
}
ds_list_destroy(beams);

while(ds_list_size(dust_beams) > 0)
{
	ds_list_destroy(dust_beams[| 0]);
	ds_list_delete(dust_beams, 0);
}
ds_list_destroy(dust_beams);
ds_list_destroy(dust_colors);
part_type_destroy(dust_pt);
part_system_clear(dust_ps);
part_system_destroy(dust_ps);