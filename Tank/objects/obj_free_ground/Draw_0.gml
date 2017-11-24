//shader_set(shd_ground);
draw_set_colour(make_colour_rgb(155, 34, 6));
/*for (var i = 0; i < instance_number(obj_pillar) - 1; i++)
{
    draw_primitive_begin(pr_trianglefan);
    draw_vertex(pillars[i].x, pillars[i].y);
    draw_vertex(pillars[i + 1].x, pillars[i + 1].y);
    draw_vertex(pillars[i + 1].x, room_height);
    draw_vertex(pillars[i].x, room_height);
    draw_primitive_end();
}*/
for (var i = 0; i < ds_list_size(dpx) - 1; i++)
{
    draw_primitive_begin(pr_trianglefan);
    draw_vertex(dpx[| i], dpy[| i]);
    draw_vertex(dpx[| i + 1], dpy[| i + 1]);
    draw_vertex(dpx[| i + 1], room_height);
    draw_vertex(dpx[| i], room_height);
    draw_primitive_end();
}

/*
for (i = 0; i < ds_list_size(dpx) - 1; i += 1)
{
    draw_set_color(c_red);
    draw_line(ds_list_find_value(dpx, i), ds_list_find_value(dpy, i), 
    ds_list_find_value(dpx, i + 1), ds_list_find_value(dpy, i + 1)); 
}*/

draw_path_sprite(my_path, 0, 0, sprite_get_height(s_mars_ground), s_mars_ground, 0, 1, 1, c_white, 1, 2, 1);
//shader_reset();

