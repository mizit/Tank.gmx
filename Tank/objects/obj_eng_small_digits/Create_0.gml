if (!instance_exists(obj_menu_eng))
{
	instance_destroy();
}
image_speed = 0;
plan_distance = obj_menu_eng.energy_d_plan_distance;
time = 4;
friction = 2 * plan_distance / sqr(time);
speed = friction * time;

back = 0;