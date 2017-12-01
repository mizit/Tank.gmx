/// @description creating directed explosion
/// @param x
/// @param y
/// @param direction
/// @param spacing - angle size
/// @param num
/// @param size
/// @param gauss

var l_x = argument0;
var l_y = argument1;
var l_direction = argument2;
var l_space = argument3;
var l_num = argument4;
var l_size = argument5;
var l_gauss = argument6;
var l_expl = instance_create_depth(l_x, l_y, depth, obj_explosion);
with (l_expl)
{
	beams_num = l_num;
	for (var i = 0; i < beams_num; i++)
	{
		var l_speed = l_size;//random(l_size);
		if (!l_gauss)
		{
			var l_dir  = random_range(l_direction - l_space, l_direction + l_space);
		}
		else
		{
			//var l_dir  = random_range(l_direction - l_space + (2 * l_space * i / beams_num), 
			//l_direction - l_space + (2 * l_space * (i + 1) / beams_num));
			var l_dir = 0;
			var qual = 1;
			repeat (qual)
			{
				l_dir += random_range(l_direction - l_space, l_direction + l_space);
			}
			l_dir /= qual;
			l_speed *= 1 / (1 + (abs(angle_difference(l_dir, l_direction)) / 10));
		}
		ds_list_add(beams, beam_create(x, y, l_speed, l_dir, l_speed / (room_speed / (4))));
		ds_list_add(dust_beams, beam_create(x, y, l_speed * 2, l_dir, l_speed / (room_speed / (8))));
		var gray = random_range(120, 140);
		ds_list_add(dust_colors, make_color_rgb(gray, gray, gray));
		var dust_size = 15;
		part_emitter_region(dust_ps, dust_em, x - dust_size, x + dust_size, y - dust_size, y + dust_size, ps_shape_ellipse, ps_distr_gaussian);
		part_type_direction(dust_pt, l_dir, l_dir, 0, 0);
		part_type_direction(ball_pt, l_dir, l_dir, 0, 0);
		part_type_color1(dust_pt, dust_colors[| i]);
		for (var j = 1; j < 5; j++)
		{
			part_type_speed(dust_pt, 0, l_speed * (j / 2), -5, 0);
			part_type_speed(ball_pt, l_speed, l_speed, 0, 0);
			part_emitter_burst(dust_ps, dust_em, dust_pt, l_speed / 2);
			part_emitter_burst(dust_ps, dust_em, ball_pt, 1);
		}
		//var tmp_part = instance_create_depth(x, y, depth - 1, obj_exp_part);
		//tmp_part.direction = l_dir;
		//tmp_part.speed = l_speed;
	}
}