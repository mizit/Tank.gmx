/// @description 
script_execute(input);


//view control
if (scale_current < scale_goal)
{
	scale_current *= (1 + scale_move);
	scale_current = min(scale_current, scale_goal);
}
if (scale_current > scale_goal)
{
	scale_current *= (1 - scale_move);
	scale_current = max(scale_current, scale_goal);
}
view_hborder = view_width * scale_current / 2;
view_vborder = view_height * scale_current / 2;
camera_set_view_size(view, view_width * scale_current, view_height * scale_current);
if (view_object)
{
	camera_set_view_pos(view, 
	max(0, min(room_width - view_width * scale_current, view_object.x - view_hborder)), 
	max(0, min(room_height - view_height * scale_current, view_object.y - view_vborder)));
}
else
{
	if (scale_current != scale_goal)
	{
		camera_set_view_pos(view, mouse_x - window_mouse_get_x() * scale_current, 
		mouse_y - window_mouse_get_y() * scale_current);
		position_x = mouse_x - window_mouse_get_x() * scale_current;
		position_y = mouse_y - window_mouse_get_y() * scale_current;
		position_xoffset = 0;
		position_yoffset = 0;
	}
	else
	{
		camera_set_view_pos(view, position_x + position_xoffset, position_y + position_yoffset);
	}
}