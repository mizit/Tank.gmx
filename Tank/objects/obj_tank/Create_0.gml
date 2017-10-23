physics_world_update_speed(room_speed * 4);
wheel_x1 = -32;
wheel_x2 = 32;
wheel_y = 32;
tower_y = -32;
rot_add = 64;

wheel1 = instance_create(x + wheel_x1, y + wheel_y, obj_wheel);
wheel2 = instance_create(x + wheel_x2, y + wheel_y, obj_wheel);
physics_joint_wheel_create(id, wheel1, x + wheel_x1, y + wheel_y, 0, 1, 0, 0, 0, 2, 10, 0);
physics_joint_wheel_create(id, wheel2, x + wheel_x2, y + wheel_y, 0, 1, 0, 0, 0, 2, 10, 0);

tower = instance_create(x, y + tower_y, obj_tower);
physics_joint_prismatic_create(id, tower, tower.x, tower.y, 1, 1, 0, 0, 1, 0, 0, 0, 0);

gun_speed = 1;
gun_min = -60;
gun_max = 0;
gun_current = 0;

base_gun = instance_create(tower.x, tower.y, obj_base_gun);
base_gun.joint = physics_joint_revolute_create(tower, base_gun, tower.x, tower.y, 0, 1, 1, 0, 0, 0, 0);

small_gun_x  = 40;
small_gun = instance_create(base_gun.x + small_gun_x, base_gun.y, obj_small_gun);
physics_joint_prismatic_create(base_gun, small_gun, small_gun.x, small_gun.y, 0.1, 0, -15, 0, 1, 250, 150, 1, 0);

