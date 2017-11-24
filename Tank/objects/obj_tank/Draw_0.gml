draw_self();
/*var shd_x, shd_y, y_offset;
y_offset = 30;
shd_x = x + lengthdir_x(sprite_width  / 2, image_angle) + 
	lengthdir_x(y_offset, image_angle - 90);
shd_y = y + lengthdir_y(y_offset, image_angle - 90) + 
	lengthdir_y(sprite_width  / 2, image_angle);
draw_sprite_ext(s_shadow, -1, shd_x, shd_y, 1, 1, image_angle, c_white, 1);*/

if (ds_list_size(obj_free_ground.dpy) > 20)
{
	var shd_path = path_add();
	var lx, rx, ly, ry;
	var lpos, rpos;
	lx = tank2.x - lengthdir_x(tank2.sprite_width + 20, tank2.image_angle);
	rx = x + lengthdir_x(sprite_width + 20, image_angle);
	lpos = ground_nearest(lx, GROUND_POS.CEIL);
	rpos = ground_nearest(rx, GROUND_POS.FLOOR);
	ly = ground_y_of_x(lx);
	ry = ground_y_of_x(rx);
	path_add_point(shd_path, lx, ly, 0);
	while (lpos != rpos)
	{
		if (obj_free_ground.dpx[| lpos] != lx)
		{
			path_add_point(shd_path, obj_free_ground.dpx[| lpos], obj_free_ground.dpy[| lpos], 0);
		}
		lpos++;
	}
	if (obj_free_ground.dpx[| lpos] != rx)
	{
		path_add_point(shd_path, obj_free_ground.dpx[| lpos], obj_free_ground.dpy[| lpos], 0);
	}
	path_add_point(shd_path, rx, ry, 0);
	path_set_closed(shd_path, 0);
	draw_path_sprite(shd_path, 0, 0, sprite_get_height(s_shadow), s_shadow, -1, 1, 1, c_white, 1, 2, 0);
	//draw_path(shd_path, 0, 0, 1);
	//draw_set_color(c_red);
	//draw_circle(lx, ly, 5, 0);
	//draw_circle(rx, ry, 5, 0);
	//draw_text(x + 100, y, path_get_number(shd_path));
	/*for (var i = 0; i < path_get_number(shd_path); i++)
	{
		draw_text(path_get_point_x(shd_path, i), path_get_point_y(shd_path, i), i);
	}*/
	path_delete(shd_path);
}