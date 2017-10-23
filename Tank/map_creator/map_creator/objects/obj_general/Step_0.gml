if (mouse_check_button_pressed(mb_left))
{
	var tmp = instance_nearest(mouse_x, mouse_y, obj_dnd);
	if (catch_distance > point_distance(mouse_x, mouse_y, tmp.x, tmp.y))
	{
		tmp.dnd = 1;
	}
	else
	{
		node_create(mouse_x, mouse_y);
	}
}
if (mouse_check_button_pressed(mb_right))
{
	var tmp = instance_nearest(mouse_x, mouse_y, obj_node);
	if (catch_distance > point_distance(mouse_x, mouse_y, tmp.x, tmp.y))
	{
		instance_destroy(tmp);
	}
}

var node_list = node_sorting();
for (var i = 0; i < ds_list_size(node_list) - 1; i++)
{
	casteljau(node_list[| i], node_list[| i + 1], 2, id);
}
ds_list_destroy(node_list);
if (keyboard_check_pressed(ord("S")))
{
	var file = file_text_open_write("level.txt");
	file_text_write_real(file, ds_list_size(bdpx));
	for (var i = 0; i < ds_list_size(bdpx); i++)
	{
		file_text_write_real(file, bdpx[| i]);
		file_text_write_real(file, bdpy[| i]);
	}
	file_text_close(file);
	surf = surface_create(room_width, room_height);
	surface_set_target(surf);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, 0);
	draw_set_color(c_white);
	for (var i = 0; i < ds_list_size(bdpx) - 1; i++)
	{
		draw_line(bdpx[| i], bdpy[| i], bdpx[| i + 1], bdpy[| i + 1]);
	}
	surface_reset_target();
	surface_save(surf, "level_image.png")
	surface_free(surf);
}