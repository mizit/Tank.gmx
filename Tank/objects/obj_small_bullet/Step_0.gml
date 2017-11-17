phy_position_x += lengthdir_x(speed, direction);
phy_position_y += lengthdir_y(speed, direction);
motion_add(270, gravity);
ds_list_add(track_x, x);
ds_list_add(track_y, y);
if (ds_list_size(track_x) > track_size)
{
    ds_list_delete(track_x, 0);
    ds_list_delete(track_y, 0);
}
if (!dead)
{
    var tmp = collision_line(x, y, x + lengthdir_x(speed, direction),
    y + lengthdir_y(speed, direction), obj_monster, 1, 1);
    if (tmp)
    {
        with (tmp)
        {
            if (behavior != DEAD)
            {
                behavior = STUN;
                hp -= 200;
            }
            //physics_apply_local_impulse(0, 0, -lengthdir_x(other.my_power, direction),
            //-lengthdir_y(other.my_power, direction));
        }
        dead = 1;
    }
    /*with (other)
    {
        physics_apply_local_impulse(0, 0, lengthdir_x(other.my_power, direction),
        lengthdir_y(other.my_power, direction));
    }*/
}
if (dead)
{
    die_cnt ++;
    if (die_cnt == ttd)
    {
        instance_destroy();
    }
}

/* */
/*  */
