physics_world_update_speed(room_speed * 4);
wheel_x1 = 12;
wheel_x2 = 40;
wheel_x3 = 80;
wheel_x4 = -24;
wheel_x5 = -50;
wheel_x6 = -84;
wheel_y = 20;
tower_y = -32;
rot_add = 2000;
damping = 4;
freq = 4;

wheel1 = instance_create_depth(x + wheel_x1, y + wheel_y, depth - 1, obj_wheel);
wheel2 = instance_create_depth(x + wheel_x2, y + wheel_y, depth - 1, obj_wheel);
wheel3 = instance_create_depth(x + wheel_x3, y + wheel_y, depth - 1, obj_wheel);
physics_joint_wheel_create(id, wheel1, x + wheel_x1, y + wheel_y, 0, 1, 0, 0, 0, freq, damping, 0);
physics_joint_wheel_create(id, wheel2, x + wheel_x2, y + wheel_y, 0, 1, 0, 0, 0, freq, damping, 0);
physics_joint_wheel_create(id, wheel3, x + wheel_x3, y + wheel_y, 0, 1, 0, 0, 0, freq, damping, 0);

physics_joint_friction_create(wheel1, wheel2, wheel1.x, wheel1.y, 0, 200, 0);
physics_joint_friction_create(wheel2, wheel3, wheel2.x, wheel2.y, 0, 200, 0);
physics_joint_friction_create(wheel3, wheel1, wheel3.x, wheel3.y, 0, 200, 0);

tank2 = instance_create_depth(x - 8, y - 8, depth, obj_tank2);
wheel4 = instance_create_depth(tank2.x + wheel_x4, y + wheel_y, depth - 1, obj_wheel);
wheel5 = instance_create_depth(tank2.x + wheel_x5, y + wheel_y, depth - 1, obj_wheel);
wheel6 = instance_create_depth(tank2.x + wheel_x6, y + wheel_y, depth - 1, obj_wheel);
physics_joint_wheel_create(tank2, wheel4, tank2.x + wheel_x4, y + wheel_y, 0, 1, 0, 0, 0, freq, damping, 0);
physics_joint_wheel_create(tank2, wheel5, tank2.x + wheel_x5, y + wheel_y, 0, 1, 0, 0, 0, freq, damping, 0);
physics_joint_wheel_create(tank2, wheel6, tank2.x + wheel_x6, y + wheel_y, 0, 1, 0, 0, 0, freq, damping, 0);

tank_switch = instance_create_depth(x - 4, y - 4, depth - 2, obj_tank_switch);
physics_joint_revolute_create(tank_switch, id, tank_switch.x, tank_switch.y, 0, 360, 0, 0, 0, 0, 0);
physics_joint_revolute_create(tank_switch, tank2, tank_switch.x, tank_switch.y, 0, 360, 0, 0, 0, 0, 0);
//tower = instance_create(x, y + tower_y, obj_tower);
//physics_joint_prismatic_create(id, tower, tower.x, tower.y, 1, 1, 0, 0, 1, 0, 0, 0, 0);

gun_speed = 1;
gun_min = -60;
gun_max = 0;
gun_current = 0;

base_gun = instance_create_depth(x - 64, y - 8, depth + 1, obj_bfg);
base_gun.joint = physics_joint_revolute_create(tank2, base_gun, base_gun.x, base_gun.y, 0, 1, 1, 0, 0, 0, 0);
base_gun.tower = tank2;


pivot_min = -20;
pivot_max = 80;
pivot_current = 0;
pivot = instance_create_depth(x + 26, y - 33, depth - 1, obj_pivot);
pivot.joint = physics_joint_revolute_create(id, pivot, pivot.x, pivot.y, 0, 1, 1, 0, 0, 0, 0);
/*small_gun_x  = 40;
small_gun = instance_create(base_gun.x + small_gun_x, base_gun.y, obj_small_gun);
physics_joint_prismatic_create(base_gun, small_gun, small_gun.x, small_gun.y, 0.1, 0, -15, 0, 1, 250, 150, 1, 0);*/

for (var i = 0; i < 5; i++)
{
	var tmp = instance_create_depth(0, 0, -1000, obj_tst_m0);//asset_get_index("obj_tst_m" + string(i)));
	tmp.type = TYPE.CONSTRUCT;
	tmp.owner = hold_list;
	ds_list_add(hold_list, tmp);
	var tmp = instance_create_depth(0, 0, -1000, obj_tst_m1);
	tmp.type = TYPE.WEAPON;
	tmp.owner = hold_list;
	ds_list_add(hold_list, tmp);
	var tmp = instance_create_depth(0, 0, -1000, obj_tst_m2);
	tmp.type = TYPE.SUPPORT;
	tmp.owner = hold_list;
	ds_list_add(hold_list, tmp);
	var tmp = instance_create_depth(0, 0, -1000, obj_module_battery1);
	//tmp.type = TYPE.ENERGY;
	tmp.owner = hold_list;
	ds_list_add(hold_list, tmp);
}
