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
}

gun_current = min(gun_max, max(gun_min, gun_current - keyboard_check(vk_up) * gun_speed +
keyboard_check(vk_down) * gun_speed));
physics_joint_set_value(base_gun.joint, phy_joint_upper_angle_limit, gun_current + 1);
physics_joint_set_value(base_gun.joint, phy_joint_lower_angle_limit, gun_current);

