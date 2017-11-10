for (var i = 0; i < ds_list_size(beams); i++)
{
	var beam = beams[| i];
	beam[| BEAM.LENGTH] += beam[| BEAM.SPEED_UP];
	if (beam[| BEAM.SPEED_UP] < 0)
	{
		beam[| BEAM.ACCEL] *= 2;
	}
	beam[| BEAM.SPEED_UP] -= beam[| BEAM.ACCEL];
	if (beam[| BEAM.LENGTH] < 0)
	{
		ds_list_delete(beams, i);
		i--;
		ds_list_destroy(beam);
	}
}

for (var i = 0; i < ds_list_size(dust_beams); i++)
{
	var beam = dust_beams[| i];
	beam[| BEAM.LENGTH] += beam[| BEAM.SPEED_UP];
	if (beam[| BEAM.SPEED_UP] < 0)
	{
		beam[| BEAM.ACCEL] *= 2;
	}
	beam[| BEAM.SPEED_UP] -= beam[| BEAM.ACCEL];
	beam_draw_parts(beam, dust_base, dust_ps, dust_pt, dust_em, dust_colors[| i]);
	if (beam[| BEAM.LENGTH] < 0)
	{
		ds_list_delete(dust_beams, i);
		ds_list_delete(dust_colors, i);
		i--;
		ds_list_destroy(beam);
	}
}

if (ds_list_size(beams) == 0) && (part_particles_count(dust_ps) == 0)
{
	instance_destroy();
}
