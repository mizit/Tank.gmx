part_system_drawit(dust_ps);
draw_set_color(c_orange);
gpu_set_blendmode(bm_add);
for (var i = 0; i < ds_list_size(beams); i++)
{
	var beam = beams[| i];
	if (beam[| BEAM.SPEED_UP] == 0)
	{
		//beam_draw(beam);
		beam_draw_triangle(beam, 20, c_orange);
	}
	else
	{
		beam_draw_triangle(beam, 20, c_orange);
	}
}
gpu_set_blendmode(bm_normal);
