var file = file_text_open_read(working_directory + file_name);
var pil_num = file_text_read_real(file);
for (var i = 0; i < pil_num; i++)
{
	ds_list_add(dpx, file_text_read_real(file));
	ds_list_add(dpy, file_text_read_real(file));
}
file_text_close(file);
/*for (var i = 0; i < instance_number(obj_pillar); i++)
{
    pillars[i] = instance_find(obj_pillar, i);
}
for (var i = 0; i < instance_number(obj_pillar); i++)
{
    var test = 0;
    for (var j = 0; j < (instance_number(obj_pillar) - 1); j++)
    {
        if (pillars[j].x > pillars[j + 1].x)
        {
            var tmp = pillars[j];
            pillars[j] = pillars[j + 1];
            pillars[j + 1] = tmp;
            test = 1;
        }
    }
    if (test == 0)
    {
        break;
    }
}

for (var i = 0; i < instance_number(obj_pillar); i++)
{
	ds_list_add(points_x, pillars[i].x);
	ds_list_add(points_y, pillars[i].y);
}
casteljau(points_x, points_y, 2, id);*/

for (var i = 0; i < (ds_list_size(dpx) - 1); i++)
{
    var fixture = physics_fixture_create();
    physics_fixture_set_polygon_shape(fixture);
    physics_fixture_add_point(fixture, dpx[| i], dpy[| i]);
    physics_fixture_add_point(fixture, dpx[| i + 1], dpy[| i + 1]);
    physics_fixture_add_point(fixture, dpx[| i + 1], room_height);
    physics_fixture_add_point(fixture, dpx[| i], room_height);
    physics_fixture_set_collision_group(fixture, 1);
    physics_fixture_set_density(fixture, 0);
    physics_fixture_bind(fixture, id);
}

ready = 1;

