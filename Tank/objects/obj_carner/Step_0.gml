event_inherited();
if (behavior != DEAD)
{
    if (obj_gg.x < x)
    {
        status |= LEFT;
    }
    else
    {
        status &=~ LEFT;
    }
}
switch (behavior)
{
    case WALK:
    {
        if (obj_gg.x < x)
        {
            physics_apply_angular_impulse(-my_power);
            image_speed = -1 / (3 / phy_speed) * sign(phy_speed_x);
            if (middle.x < x) || (tail.x < x)
            {
                physics_apply_local_impulse(0, 0, -45, -45);
            }
        }
        else
        {
            physics_apply_angular_impulse(my_power);
            image_speed = 1 / (3 / phy_speed) * sign(phy_speed_x);
            if (middle.x > x)|| (tail.x > x)
            {
                physics_apply_local_impulse(0, 0, 45, -45);
            }
        }
        if (point_distance(x, y, obj_gg.x, obj_gg.y) <= attack_distance)
        {
            behavior = ATTACK;
            sprite_index = s_carner_attack;
            image_speed = 1;
        }
        break;
    }
    case ATTACK:
    {
        if (point_distance(x, y, obj_gg.x, obj_gg.y) > attack_distance) && (image_index > image_number - 2)
        {
            behavior = WALK;
            sprite_index = s_carner_walk;
        }
        var curr_x_off;
        if (status & LEFT)
        {
            curr_x_off = -attack_x;
        }
        else
        {
            curr_x_off = attack_x;
        }
        if ((image_index > 3) && (image_index < 5) && 
        collision_rectangle(x, y, x + curr_x_off, y + attack_y, obj_player, 1, 1))
        {
            with (obj_gg)
            {
                var dir = point_direction(other.x, other.y, x, y);
                physics_apply_impulse(other.x + curr_x_off, other.y, 
                lengthdir_x(other.attack_power, dir), lengthdir_y(other.attack_power, dir));
            }
        }
        break;
    }
    case STUN:
    {
        phy_rotation = 0;
        /*if (obj_gg.x < x)
        {
            phy_rotation = 0;
            physics_apply_angular_impulse(my_power);
            image_speed = -1 / (3 / phy_speed) * sign(phy_speed_x);
            with(middle)
            {
                phy_rotation = 0;
                physics_apply_angular_impulse(other.my_power);
            }
            with(tail)
            {
                phy_rotation = 0;
                physics_apply_angular_impulse(other.my_power);
            }
        }
        else
        {
            phy_rotation = 0;
            physics_apply_angular_impulse(-my_power);
            image_speed = 1 / (3 / phy_speed) * sign(phy_speed_x);
            with(middle)
            {
                phy_rotation = 0;
                physics_apply_angular_impulse(-other.my_power);
            }
            with(tail)
            {
                phy_rotation = 0;
                physics_apply_angular_impulse(-other.my_power);
            }
        }*/
        stun_counter++;
        if (stun_counter >= stun_time)
        {
            stun_counter = 0;
            behavior = WALK;
        }
        break;
    }
    case DEAD:
    {
        if (image_index >= image_number - 1)
        {
            image_speed = 0;
        }
        break;
    }
}
middle.status = status;
tail.status = status;


/* */
/*  */
