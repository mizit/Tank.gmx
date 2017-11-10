/// @description isoscelos triangle
/// @param beam
/// @param width base of triangle
/// @param color

var l_beam = argument0;
var l_width = argument1;
var l_color = argument2;

var l_x1, l_x2, l_y1, l_y2;
l_x1 = l_beam[| BEAM.X] + lengthdir_x(l_width / 2, l_beam[| BEAM.DIR] + 90);
l_x2 = l_beam[| BEAM.X] + lengthdir_x(l_width / 2, l_beam[| BEAM.DIR] - 90);
l_y1 = l_beam[| BEAM.Y] + lengthdir_y(l_width / 2, l_beam[| BEAM.DIR] + 90);
l_y2 = l_beam[| BEAM.Y] + lengthdir_y(l_width / 2, l_beam[| BEAM.DIR] - 90);

var tmp_color = draw_get_color();
draw_set_color(l_color);
draw_primitive_begin(pr_trianglelist);
draw_vertex(l_x1, l_y1);
draw_vertex(l_x2, l_y2);
draw_vertex(l_beam[| BEAM.X] + lengthdir_x(l_beam[| BEAM.LENGTH], l_beam[| BEAM.DIR]),
l_beam[| BEAM.Y] + lengthdir_y(l_beam[| BEAM.LENGTH], l_beam[| BEAM.DIR]));
draw_primitive_end();