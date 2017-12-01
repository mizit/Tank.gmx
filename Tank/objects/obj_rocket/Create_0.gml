wiggle = 2;
grav = 0.1;
//speed = 15;
//physics_apply_impulse(x, y, 50, -15);
phy_rotation = random_range(-20, -40);
thrust_pwr = 300;
man_pwr = 100;
man_max_pwr = 2;
wiggle_pwr = 5;
goal = noone;
physics_apply_local_impulse(0, 0, 100, 0);
physics_apply_local_force(-5, 0, thrust_pwr, 0);
//phy_fixed_rotation = 1;

track_size = 30;
track_x = ds_list_create();
track_y = ds_list_create();

ttd = track_size;
die_cnt = 0;
dead = 0;