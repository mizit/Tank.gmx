if (!dead)
{
	var l_arr = collision_line_prec(xprevious, yprevious, x, y, obj_free_ground);
	explosion_create(l_arr[VEC2_X], l_arr[VEC2_Y], 90, 30, 20, 40, 1);
}
dead = 1;
