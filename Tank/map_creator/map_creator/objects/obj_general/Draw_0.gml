draw_set_color(c_green);
for (var i = 0; i < ds_list_size(bdpx) - 1; i++)
{
	draw_line_width(bdpx[| i], bdpy[| i], bdpx[| i + 1], bdpy[| i + 1], 5);
}
draw_set_color(c_white);
draw_text(100, 100, ds_list_size(bdpx));
ds_list_clear(bdpx);
ds_list_clear(bdpy);
draw_rectangle(0, 0, room_width, room_height, 1);