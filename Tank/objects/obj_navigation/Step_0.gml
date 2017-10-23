if (keyboard_check_pressed(ord("X")))
{
    goal_scale = min(goal_scale * step, max_scale);
}
if (keyboard_check_pressed(ord("Z")))
{
    goal_scale = max(goal_scale / step, min_scale);
}

if (goal_scale > current_scale)
{
    current_scale = min(goal_scale, current_scale * little_step);
}
if (goal_scale < current_scale)
{
    current_scale = max(goal_scale, current_scale / little_step);
}

__view_set( e__VW.WView, 0, current_scale * base_width );
__view_set( e__VW.HView, 0, current_scale * base_height );
__view_set( e__VW.HBorder, 0, current_scale * base_width / 2 );
__view_set( e__VW.VBorder, 0, current_scale * base_height / 2 );

