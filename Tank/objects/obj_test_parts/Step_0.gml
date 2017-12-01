if (mouse_check_button(mb_left))
{
	var size = 20;
	part_emitter_region(ps, em, mouse_x - size, mouse_x + size,
	mouse_y - size, mouse_y + size, ps_shape_ellipse, ps_distr_gaussian);
	for (var i = 20; i < 100; i+= 20)
	{
		part_type_speed(pt, 0.1, i, -10, 0);
		part_emitter_burst(ps, em, pt, 80);
	}
}