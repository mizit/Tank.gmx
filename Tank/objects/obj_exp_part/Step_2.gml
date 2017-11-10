var r = 5;
if (ttl_cnt < ttl)
{
	//part_emitter_region(ps, em, x - r, x + r, y - r, y + r, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_region(ps, em, xprevious, x, yprevious, y, ps_shape_line, ps_distr_linear);
	part_emitter_burst(ps, em, pt, 15);
}
else
{
	current_alpha = max(0, current_alpha - alpha_dec);
	if (current_alpha > 0)
	{
		part_type_alpha2(pt, current_alpha, 0);
		part_emitter_region(ps, em, xprevious, x, yprevious, y, ps_shape_line, ps_distr_linear);
		part_emitter_burst(ps, em, pt, 15);
	}
	else
	{
		if (part_particles_count(ps) == 0)
		{
			instance_destroy();
		}
	}
}

ttl_cnt ++;