gun_speed = 1;
gun_min = -60;
gun_max = 0;
gun_current = 0;

geer = instance_create(x, y, obj_geer);
geer.joint = physics_joint_revolute_create(id, geer, x, y, 0, 0, 1, 0, 0, 0, 0);

base_gun = instance_create(x, y, obj_base_gun);
base_gun.joint = physics_joint_prismatic_create(geer, base_gun, geer.x, geer.y, 0.1, 0, -5, 0, 1, 1200, 350, 1, 0);

small_gun_x  = 30;
small_gun = instance_create(base_gun.x + small_gun_x, base_gun.y, obj_small_gun);
physics_joint_prismatic_create(base_gun, small_gun, small_gun.x, small_gun.y, 0.1, 0, -15, 0, 1, 250, 150, 1, 0);
small_gun.tower = id;

