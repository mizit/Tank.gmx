/// @description shader_draw_sandbox(shader)
/// @function shader_draw_sandbox
/// @param shader
shader_set(argument0);
var tmp_w, tmp_h;
tmp_w = 1024;
tmp_h = 1024;
shader_set_uniform_f(time,get_timer()/1000000);
shader_set_uniform_f(resolution, tmp_w, window_get_height());
shader_set_uniform_f(mouse, median(0, mouse_x/tmp_w ,1), median(0, mouse_y/tmp_h,1));
draw_primitive_begin_texture(pr_trianglestrip, -1);
draw_vertex_texture(tmp_w, tmp_h, tmp_w, 0);
draw_vertex_texture(0, tmp_h, 0, 0);
draw_vertex_texture(tmp_w, 0, tmp_w, tmp_h);
draw_vertex_texture(0, 0, 0, tmp_h);
draw_primitive_end();
shader_reset();
