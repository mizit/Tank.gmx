/*direction += random_range(-wiggle, wiggle);
hspeed = lengthdir_x(speed, direction);
vspeed = lengthdir_y(speed, direction) + grav;
direction = point_direction(0, 0, hspeed, vspeed);
phy_position_x += hspeed;
phy_position_y += vspeed;
phy_rotation = -direction;*/
phy_rotation = -point_direction(0, 0, phy_speed_x, phy_speed_y);

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
        }
        dead = 1;
    }
}
if (dead)
{
    die_cnt ++;
    if (die_cnt == ttd)
    {
        instance_destroy();
    }
}