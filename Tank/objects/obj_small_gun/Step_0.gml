if (keyboard_check_pressed(vk_space))
{
    physics_apply_local_impulse(0, 0, -2000, 0);
    var bullet = instance_create(x + lengthdir_x(sprite_width, image_angle),
    y + lengthdir_y(sprite_width, image_angle), obj_bullet);
    //bullet.image_angle = image_angle;
    with (bullet)
    {
        direction = other.image_angle;
        //phy_bullet = true;
        //phy_rotation = other.phy_rotation;
        //physics_apply_local_impulse(0, 0, 2000, 0);
        /*physics_apply_impulse(x, y, lengthdir_x(200, other.image_angle), 
        lengthdir_y(200, other.image_angle));*/
    }
    var fire = instance_create(x + lengthdir_x(sprite_width - 10, image_angle),
    y + lengthdir_y(sprite_width - 10, image_angle), obj_test_fire);
    fire.image_angle = image_angle;
    with(tower)
    {
        physics_apply_local_impulse(lengthdir_x(1, other.image_angle), 
        lengthdir_y(1, other.image_angle), -2000, 0);
    }
}

if (keyboard_check_pressed(ord("1")))
{
	var marker = instance_create(x + lengthdir_x(sprite_width, image_angle),
    y + lengthdir_y(sprite_width, image_angle), obj_marker);
	with (marker)
	{
		physics_apply_impulse(x, y, lengthdir_x(25, other.image_angle), lengthdir_y(25, other.image_angle));
		phy_rotation = -15;
	}
}

/* */
/*  */
