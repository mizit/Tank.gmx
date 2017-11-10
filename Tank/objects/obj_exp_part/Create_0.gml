ttl = random_range(15, 25);
ttl_cnt = 0;
current_alpha = 1;
alpha_dec = 0.1;

friction = 0.1;
gravity = 0.2;

ps = part_system_create()

pt = part_type_create();
part_type_shape(pt, pt_shape_explosion);
part_type_life(pt, 0, 10);
part_type_color1(pt, c_orange);
part_type_alpha2(pt, current_alpha, 0);
part_type_size(pt, 0.03, 0.06, 0, 0);
part_type_blend(pt, 1);

em = part_emitter_create(ps);
