ps = part_system_create();
//part_system_automatic_draw(ps, 0);
pt = part_type_create();
em = part_emitter_create(ps);
dust_base = 30;
part_type_alpha2(pt, 0.5, 0);
part_type_shape(pt, pt_shape_smoke);
part_type_color1(pt, c_gray);
part_type_size(pt, 0.1, 0.3, -0.01, 0);
part_type_speed(pt, 0.1, 80, -10, 0);
part_type_direction(pt, 0, 0, 0, 0);
part_type_orientation(pt, 0, 360, 0, 0, 0);