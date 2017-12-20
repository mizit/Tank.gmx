x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
if (!back)
{
	speed = max(0, speed - friction);
}
else
{
	speed -= friction;
	if (speed < -friction * time)
	{
		instance_destroy();
	}
}


surface_set_target(obj_menu_eng.energy_d_surf);
draw_self();
surface_reset_target();