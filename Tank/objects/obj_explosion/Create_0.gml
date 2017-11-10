enum BEAM
{
	X = 0,
	Y = 1,
	LENGTH = 2,
	DIR = 3,
	SPEED_UP = 4,
	SPEED_DOWN = 5,
	ACCEL = 6
}

beams = ds_list_create();
dust_beams = ds_list_create();
dust_colors = ds_list_create();
beams_num = 0;
/*for (var i = 0; i < beams_num; i++)
{
	var l_speed = random(20);
	var l_dir  = random_range(360 * i / beams_num, 360 * (i + 1) / beams_num);
	l_dir = random(360);
	ds_list_add(beams, beam_create(x, y, l_speed, l_dir, l_speed / (room_speed / 6)));
	ds_list_add(dust_beams, beam_create(x, y, l_speed * 2, l_dir, l_speed / (room_speed / 12)));
	var gray = 40 + i * 7;
	ds_list_add(dust_colors, make_color_rgb(gray, gray, gray));
}*/


dust_ps = part_system_create();
part_system_automatic_draw(dust_ps, 0);
dust_pt = part_type_create();
dust_em = part_emitter_create(dust_ps);
dust_base = 30;
part_type_alpha2(dust_pt, 1, 0);
//part_type_shape(dust_pt, pt_shape_smoke);
part_type_shape(dust_pt, pt_shape_disk);
part_type_color1(dust_pt, c_gray);
part_type_size(dust_pt, 0.05, 0.1, 0.0, 0);
part_type_speed(dust_pt, 0.5, 1, 0, 0.1);
part_type_direction(dust_pt, 260, 280, 0, 5);

//traces = ds_list_create();

