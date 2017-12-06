if (os_is_paused())
{
	if (sprite_exists(sprite))
	{
		sprite_delete(sprite);
	}
	sprite = sprite_create_from_surface(surf, 0, 0, surface_get_width(surf), 
	surface_get_height(surf), 1, 0, 0, 0);
}

if (!surface_exists(surf))
{
	surf = surface_create(window_get_width(), window_get_height());
	if (sprite_exists(sprite))
	{
		surface_set_target(surf);
		draw_sprite(sprite, -1, 0, 0);
		surface_reset_target();
		sprite_delete(sprite);
	}
}