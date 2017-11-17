if (keyboard_check_pressed(vk_space) && (image_speed == 0))
{
	image_speed = 0.5;
    physics_apply_local_impulse(0, 0, -2000, 0);
    var bullet = instance_create(x + lengthdir_x(sprite_width, image_angle),
    y + lengthdir_y(sprite_width, image_angle), obj_bullet);
    with (bullet)
    {
        direction = other.image_angle;
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