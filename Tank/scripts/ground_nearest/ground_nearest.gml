/// @description find point of ground on x coord
/// @param x
/// @param nearest, ceil, floor
/// @return num

enum GROUND_POS
{
	NEAREST,
	CEIL,
	FLOOR
}

var l_x = argument0;
var l_type = argument1;

if (instance_exists(obj_free_ground))
{
	with (obj_free_ground)
	{
		var qual = ds_list_size(dpx) - 1;
		var cnt = qual;
		for (var mult = 2; mult < qual; mult *=2)
		{
			//show_message("x" + string(l_arr[VEC2_X]));
			//show_message("y" + string(l_arr[VEC2_Y]));
			if (dpx[| round(cnt)] > l_x)
			{
				cnt -= qual / mult;
			}
			else
			{
				cnt += qual / mult;
			}
		}
	}
	switch (l_type)
	{
		case GROUND_POS.NEAREST:
			return round(cnt);
			break;
		case GROUND_POS.CEIL:
			return ceil(cnt);
			break;
		case GROUND_POS.FLOOR:
			return floor(cnt);
			break;
	}
}
else
{
	show_message("Ground doesn't exist.");
}