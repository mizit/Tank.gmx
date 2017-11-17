speed = 25;
gravity = 1.5;
depth = 100;

track_size = 15;
track_x = ds_list_create();
track_y = ds_list_create();

ttd = track_size;
die_cnt = 0;
dead = 0;

my_power = 500;

ps = part_system_create();
part_system_depth(ps, obj_free_ground + 1);

pt = part_type_create();
part_type_shape(pt, pt_shape_smoke);
part_type_speed(pt, 3, 10, -1, 0.5);
part_type_life(pt, 10, 20);
part_type_size(pt, 0.1, 0.2, 0.01, 0);
part_type_alpha2(pt, 1, 0);
part_type_direction(pt, 60, 120, 0, 1);
part_type_color1(pt, c_gray);
part_type_orientation(pt, 0, 360, 0, 0, 0);

em = part_emitter_create(ps);