/// @description bezier between two nodes
/// @param node1
/// @param node2
/// @param qual
/// @param obj
var node1, node2, level, qual, f_x, f_y, obj;
node1 = argument0;
node2 = argument1;
qual = argument2;
obj = argument3;

var points_x = ds_list_create();
var points_y = ds_list_create();

ds_list_add(points_x, node1.x);
ds_list_add(points_x, node1.shoulder2.x);
ds_list_add(points_x, node2.shoulder1.x);
ds_list_add(points_x, node2.x);

ds_list_add(points_y, node1.y);
ds_list_add(points_y, node1.shoulder2.y);
ds_list_add(points_y, node2.shoulder1.y);
ds_list_add(points_y, node2.y);

obj.dpx = ds_list_create();
obj.dpy = ds_list_create();
var fx, fy;
fx = ds_list_create();
fy = ds_list_create();
just(points_x, points_y, ds_list_size(points_x) - 1, qual, fx, fy, obj);
ds_list_destroy(fx);
ds_list_destroy(fy);

for (var i = 0; i < ds_list_size(obj.dpx); i++)
{
	ds_list_add(obj.bdpx, obj.dpx[| i]);
	ds_list_add(obj.bdpy, obj.dpy[| i]);
}
ds_list_destroy(obj.dpx);
ds_list_destroy(obj.dpy);
ds_list_destroy(points_x);
ds_list_destroy(points_y);