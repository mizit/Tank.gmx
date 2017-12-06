instance_activate_all();
physics_pause_enable(0);
surface_free(surf);
if (sprite_exists(sprite))
{
	sprite_delete(sprite);
}