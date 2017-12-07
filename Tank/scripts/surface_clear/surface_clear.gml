/// @description clearing surface
/// @param surf
var l_color = draw_get_color();
surface_set_target(argument0);
gpu_set_blendmode(bm_subtract);
draw_set_color(c_black);
draw_rectangle(0, 0, surface_get_width(argument0), surface_get_height(argument0), 0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_set_color(l_color);