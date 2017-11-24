draw_self();
var shd_x, shd_y, y_offset;
y_offset = 30;
shd_x = x + lengthdir_x(sprite_width  / 2, image_angle) + 
	lengthdir_x(y_offset, image_angle - 90);
shd_y = y + lengthdir_y(y_offset, image_angle - 90) + 
	lengthdir_y(sprite_width  / 2, image_angle);
draw_sprite_ext(s_shadow, -1, shd_x, shd_y, 1, 1, image_angle, c_white, 1);

if (ds_list_size(obj_free_ground.dpy) > 20)
{
	draw_set_color(c_red);
	var test_x = ground_nearest(x, GROUND_POS.CEIL);
	draw_circle(obj_free_ground.dpx[| test_x], obj_free_ground.dpy[| test_x], 5, 0);
}