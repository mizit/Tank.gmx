gun_current = noone;

physics_world_update_speed(room_speed * 4);
wheel_x1 = -32;
wheel_x2 = 32;
wheel_x3 = -96;
wheel_x4 = 96;
wheel_y = 48;
tower_y = -37;
tower_x = 32;
rot_add = 64;

wheel1 = instance_create(x + wheel_x1, y + wheel_y, obj_wheel);
wheel2 = instance_create(x + wheel_x2, y + wheel_y, obj_wheel);
wheel3 = instance_create(x + wheel_x3, y + wheel_y, obj_wheel);
wheel4 = instance_create(x + wheel_x4, y + wheel_y, obj_wheel);
physics_joint_wheel_create(id, wheel1, x + wheel_x1, y + wheel_y, 0, 0.5, 0, 0, 0, 2, 10, 0);
physics_joint_wheel_create(id, wheel2, x + wheel_x2, y + wheel_y, 0, 0.5, 0, 0, 0, 2, 10, 0);
physics_joint_wheel_create(id, wheel3, x + wheel_x3, y + wheel_y, 0, 0.5, 0, 0, 0, 2, 10, 0);
physics_joint_wheel_create(id, wheel4, x + wheel_x4, y + wheel_y, 0, 0.5, 0, 0, 0, 2, 10, 0);

physics_joint_friction_create(wheel1, wheel2, wheel1.x, wheel1.y, 0, 200, 0);
physics_joint_friction_create(wheel2, wheel3, wheel2.x, wheel2.y, 0, 200, 0);
physics_joint_friction_create(wheel3, wheel4, wheel3.x, wheel3.y, 0, 200, 0);
physics_joint_friction_create(wheel4, wheel1, wheel4.x, wheel4.y, 0, 200, 0);

rooms[0] = instance_create(x - 96, y - 52, obj_room);
physics_joint_prismatic_create(id, rooms[0], rooms[0].x, rooms[0].y, 1, 1, 0, 0, 1, 0, 0, 0, 0);
rooms[1] = instance_create(x - 32, y - 52, obj_room);
physics_joint_prismatic_create(id, rooms[1], rooms[1].x, rooms[1].y, 1, 1, 0, 0, 1, 0, 0, 0, 0);
rooms[2] = instance_create(x + 64, y - 52, obj_room_med);
physics_joint_prismatic_create(id, rooms[2], rooms[2].x, rooms[2].y, 1, 1, 0, 0, 1, 0, 0, 0, 0);
rooms[4] = instance_create(x - 96, y - 116, obj_room_half2);
physics_joint_prismatic_create(id, rooms[4], rooms[4].x, rooms[4].y, 1, 1, 0, 0, 1, 0, 0, 0, 0);
rooms[5] = instance_create(x, y - 116, obj_room_med);
physics_joint_prismatic_create(id, rooms[5], rooms[5].x, rooms[5].y, 1, 1, 0, 0, 1, 0, 0, 0, 0);


tower = instance_create(x + tower_x, y + tower_y, obj_tower);
physics_joint_prismatic_create(id, tower, tower.x, tower.y, 1, 1, 0, 0, 1, 0, 0, 0, 0);



