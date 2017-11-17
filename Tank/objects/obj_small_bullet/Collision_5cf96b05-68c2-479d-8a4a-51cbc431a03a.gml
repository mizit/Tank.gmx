if (!dead)
{
	var l_arr = collision_line_prec(xprevious, yprevious, x, y, obj_free_ground);
	var l_size = 3;
	part_emitter_region(ps, em, l_arr[VEC2_X] - l_size, l_arr[VEC2_X] + l_size,
	l_arr[VEC2_Y], l_arr[VEC2_Y] + 2 * l_size, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ps, em, pt, 30);
	//effect_create_below(ef_explosion, l_arr[VEC2_X], l_arr[VEC2_Y], 1, c_orange);
	//explosion_create(l_arr[VEC2_X], l_arr[VEC2_Y], 90, 30, 20, 10, 1);
}
dead = 1;
