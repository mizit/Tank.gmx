gun_current = min(gun_max, max(gun_min, gun_current - keyboard_check(vk_up) * gun_speed +
keyboard_check(vk_down) * gun_speed));
physics_joint_set_value(geer.joint, phy_joint_upper_angle_limit, gun_current);
physics_joint_set_value(geer.joint, phy_joint_lower_angle_limit, gun_current);

