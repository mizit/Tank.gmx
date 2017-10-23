if (!instance_place(x, y + 1, obj_ground))
{
    physics_apply_local_impulse(0, 0, 0, 0.5);
}
else
{
    physics_apply_local_impulse(0, 0, 0.5, 0);
}

