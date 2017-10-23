if (keyboard_check(vk_right))
{
    with (obj_wheel)
    {
        physics_apply_angular_impulse(other.rot_add);
    }
} 
else if (keyboard_check(vk_left))
{
    with (obj_wheel)
    {
        physics_apply_angular_impulse(-other.rot_add);
    }
}



