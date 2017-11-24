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
			cnt = round(cnt);
			if (dpx[| cnt] > l_x)
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
			while (obj_free_ground.dpx[| ceil(cnt)] < l_x)
			{
				cnt++;
			}
			return ceil(cnt);
			break;
		case GROUND_POS.FLOOR:
		while (obj_free_ground.dpx[| floor(cnt)] > l_x)
			{
				cnt--;
			}
			return floor(cnt);
			break;
	}
}
else
{
	show_message("Ground doesn't exist.");
}