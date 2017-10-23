// This is my version of view control
// It can force view follow for object without bounce.
// It can scale view

//This the part of managment of scaling view
//You can see how I use it in input_view script
scale_step = 0.3;	//Step when you wheel up/down
scale_current = 1;	//Current scale of view
scale_min = 0.3;	//Min and max scale
scale_max = 5;

//There is smooth of change scale
scale_move = 0.03;	//if scale_goal isn't equal to scale_current
					//scale_current will change on scale_move
scale_goal = 1;


view = view_camera[0];						//We are controlling this view.
view_width = camera_get_view_width(view);
view_height = camera_get_view_height(view);
view_hborder = view_width / 2;
view_vborder = view_height / 2;
view_object = noone;						//View follow this object
input = input_view;

position_x = 0;
position_y = 0;
position_xoffset = 0;
position_yoffset = 0;
mouse_x_latch = noone;
mouse_y_latch = noone;