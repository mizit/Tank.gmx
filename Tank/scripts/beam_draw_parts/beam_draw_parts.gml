/// @description parts triangle
/// @param beam
/// @param width base of triangle
/// @param part_system
/// @param part_type
/// @param part_emitter
/// @param color

var l_beam = argument0;
var l_width = argument1;
var l_ps = argument2;
var l_pt = argument3;
var l_em = argument4;
var l_color = argument5;

for (var i = 0; i < l_beam[| BEAM.LENGTH]; i+=5)
{
	var l_w = l_width * (1 - i / l_beam[| BEAM.LENGTH]);
	part_type_color1(l_pt, l_color);
	part_emitter_region(l_ps, l_em, l_beam[| BEAM.X] + lengthdir_x(i, l_beam[| BEAM.DIR]) - l_w,
	l_beam[| BEAM.X] + lengthdir_x(i, l_beam[| BEAM.DIR]) + l_w,
	l_beam[| BEAM.Y] + lengthdir_y(i, l_beam[| BEAM.DIR]) - l_w,
	l_beam[| BEAM.Y] + lengthdir_y(i, l_beam[| BEAM.DIR]) + l_w,
	ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(l_ps, l_em, l_pt, 1);
}