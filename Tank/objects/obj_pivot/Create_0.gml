gun_list[0] = instance_create_depth(x + 10, y - 5, depth + 1, obj_chopper);
gun_list[1] = instance_create_depth(x + 10, y, depth + 1, obj_chopper);
gun_list[1].sprite_index = s_small_gun2;
gun_list[2] = instance_create_depth(x + 10, y - 5, depth + 2, obj_chopper);
gun_list[2].sprite_index = s_small_gun3;
gun_list[3] = instance_create_depth(x + 10, y, depth + 2, obj_chopper);
gun_list[3].sprite_index = s_small_gun3;
for (var i = 0; i < 4; i++)
{
	gun_list[i].owner = id;
	gun_list[i].x_offset = gun_list[i].x - x;
	gun_list[i].y_offset = gun_list[i].y - y;
}

tbs = room_speed / 4;
tbs_cnt = tbs;
gun_cnt = 0;
gun_num = 4;