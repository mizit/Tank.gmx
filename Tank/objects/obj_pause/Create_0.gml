surf = surface_create(window_get_width(), window_get_height());
sprite = noone;
surface_set_target(surf);
draw_surface(application_surface, 0, 0);
surface_reset_target();
instance_deactivate_all(1);
physics_pause_enable(1);