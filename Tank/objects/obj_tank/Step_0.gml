if (keyboard_check(vk_right))
{
    with (wheel1)
    {
        physics_apply_angular_impulse(other.rot_add);
    }
    with (wheel2)
    {
        physics_apply_angular_impulse(other.rot_add);
    }
	with (wheel3)
    {
        physics_apply_angular_impulse(other.rot_add);
    }
	with (wheel4)
    {
        physics_apply_angular_impulse(other.rot_add);
    }
    with (wheel5)
    {
        physics_apply_angular_impulse(other.rot_add);
    }
	with (wheel6)
    {
        physics_apply_angular_impulse(other.rot_add);
    }
} 
else if (keyboard_check(vk_left))
{
    with (wheel1)
    {
        physics_apply_angular_impulse(-other.rot_add);
    }
    with (wheel2)
    {
        physics_apply_angular_impulse(-other.rot_add);
    }
	with (wheel3)
    {
        physics_apply_angular_impulse(-other.rot_add);
    }
	with (wheel4)
    {
        physics_apply_angular_impulse(-other.rot_add);
    }
    with (wheel5)
    {
        physics_apply_angular_impulse(-other.rot_add);
    }
	with (wheel6)
    {
        physics_apply_angular_impulse(-other.rot_add);
    }
}

gun_current = min(gun_max, max(gun_min, gun_current - keyboard_check(vk_up) * gun_speed +
keyboard_check(vk_down) * gun_speed));
physics_joint_set_value(base_gun.joint, phy_joint_upper_angle_limit, gun_current + 1);
physics_joint_set_value(base_gun.joint, phy_joint_lower_angle_limit, gun_current);

var piv_dir = point_direction(pivot.x, pivot.y, mouse_x, mouse_y);
if (piv_dir > 180)
{
	piv_dir -= 360;
}
pivot_current = - clamp(piv_dir, pivot_min, pivot_max);
physics_joint_set_value(pivot.joint, phy_joint_upper_angle_limit, pivot_current + 1);
physics_joint_set_value(pivot.joint, phy_joint_lower_angle_limit, pivot_current);

if (keyboard_check(vk_control))
{
	if (!instance_exists(obj_goal))
	{
		instance_create(3000, ground_y_of_x(3000), obj_goal);
	}
	var tmp = instance_create(x, y, obj_rocket);
	tmp.direction = 25;
	tmp.goal = obj_goal;
}