/// @description finding point where we input to object
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param obj
/// @return ret_arr

var l_x1 = argument0;
var l_y1 = argument1;
var l_x2 = argument2;
var l_y2 = argument3;
var l_obj = argument4;
var l_arr;
l_arr[VEC2_X] = l_x2;
l_arr[VEC2_Y] = l_y2;
var qual = point_distance(l_x1, l_y1, l_x2, l_y2);
var dir = point_direction(l_x1, l_y1, l_x2, l_y2);
for (var mult = 2; mult < qual; mult *=2)
{
	//show_message("x" + string(l_arr[VEC2_X]));
	//show_message("y" + string(l_arr[VEC2_Y]));
	
	if (physics_test_overlap(l_arr[VEC2_X], l_arr[VEC2_Y], 0, l_obj))//place_meeting(l_arr[VEC2_X], l_arr[VEC2_Y], l_obj))
	{
		l_arr[VEC2_X] -= lengthdir_x(qual / mult, dir);
		l_arr[VEC2_Y] -= lengthdir_y(qual / mult, dir);
	}
	else
	{
		l_arr[VEC2_X] += lengthdir_x(qual / mult, dir);
		l_arr[VEC2_Y] += lengthdir_y(qual / mult, dir);
	}
}
return l_arr;