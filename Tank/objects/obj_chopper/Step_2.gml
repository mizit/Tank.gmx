if (fire)
{
	fire = 0;
	cur_xoff = -fire_offset;
	var bullet = instance_create(x + lengthdir_x(sprite_width, image_angle),
    y + lengthdir_y(sprite_width, image_angle), obj_small_bullet);
    with (bullet)
    {
        direction = other.image_angle + random_range(-other.accuracy, other.accuracy);
    }
}

if (owner)
{
	image_angle = owner.image_angle;
	x = owner.x + lengthdir_x(cur_xoff, image_angle) + 
	lengthdir_x(y_offset, image_angle - 90);
	y = owner.y + lengthdir_y(y_offset, image_angle - 90) + 
	lengthdir_y(cur_xoff, image_angle);
}

cur_xoff = min(cur_xoff + x_speed, x_offset);