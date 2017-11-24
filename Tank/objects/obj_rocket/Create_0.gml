wiggle = 2;
grav = 0.1;
//speed = 15;
//physics_apply_impulse(x, y, 50, -15);
phy_rotation = -25;
physics_apply_local_impulse(0, 0, 50, 0);
phy_fixed_rotation = 1;

track_size = 30;
track_x = ds_list_create();
track_y = ds_list_create();

ttd = track_size;
die_cnt = 0;
dead = 0;