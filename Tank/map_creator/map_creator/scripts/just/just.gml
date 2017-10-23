var p_x, p_y, level, level_h, f_x, f_y, obj;
p_x = argument0;
p_y = argument1;
level = argument2;
level_h = argument3;
f_x = argument4;
f_y = argument5;
obj = argument6;
var nbx, nby;
nbx = ds_list_create();
nby = ds_list_create();
for (var i = 0; i < ds_list_size(p_x) - 1; i+=1)
{
    var bufx, bufy;
    
    bufx = (ds_list_find_value(p_x, i) + ds_list_find_value(p_x, i + 1)) / 2;
    bufy = (ds_list_find_value(p_y, i) + ds_list_find_value(p_y, i + 1)) / 2;
    ds_list_add(nbx, bufx);
    ds_list_add(nby, bufy);
}   
var a;
if (level == 0)
{
    a = ds_list_size(f_x) / 2;
    ds_list_insert(f_x, a, ds_list_find_value(p_x, 0));
    ds_list_insert(f_y, a, ds_list_find_value(p_y, 0));
    if (level_h > 0)
    {
        var jxl, jyl, jxr, jyr;
        jxl = ds_list_create();
        jyl = ds_list_create();
        jxr = ds_list_create();
        jyr = ds_list_create();
        a = ceil(ds_list_size(f_x) / 2);
        for (var i = 0; i < a; i+=1)
        {
            ds_list_add (jxl, ds_list_find_value(f_x, i));
            ds_list_add (jyl, ds_list_find_value(f_y, i));
            ds_list_add (jxr, ds_list_find_value(f_x, a + i - 1));
            ds_list_add (jyr, ds_list_find_value(f_y, a + i - 1));
        } 
        var bx,by;
        bx = ds_list_create();
        by = ds_list_create();
        just(jxl, jyl, ds_list_size(jxl) - 1, level_h - 1, bx, by, obj);
        ds_list_clear(bx);
        ds_list_clear(by);
        just(jxr, jyr, ds_list_size(jxr) - 1, level_h - 1, bx, by, obj);
        ds_list_destroy(jxl);
        ds_list_destroy(jyl);
        ds_list_destroy(jxr);
        ds_list_destroy(jyr);
        ds_list_destroy(bx);
        ds_list_destroy(by);
    }
    else
    {
        if (!instance_exists(obj))
        {
            instance_create_depth(0, 0, 0, obj);
        }
        for (var i = 0; i < ds_list_size(f_x); i+=1)
        {
            ds_list_add(obj.dpx, ds_list_find_value(f_x, i));
            ds_list_add(obj.dpy, ds_list_find_value(f_y, i));
        }
    }  
	ds_list_destroy(nbx);
    ds_list_destroy(nby);
}
else
{  
    a = ds_list_size(f_x) / 2;
    ds_list_insert(f_x, a, ds_list_find_value(p_x, 0));
    ds_list_insert(f_y, a, ds_list_find_value(p_y, 0));
    ds_list_insert(f_x, a + 1, ds_list_find_value(p_x, ds_list_size(p_x) - 1));
    ds_list_insert(f_y, a + 1, ds_list_find_value(p_y, ds_list_size(p_y) - 1));
    just(nbx, nby, level - 1, level_h, f_x, f_y, obj);
    ds_list_destroy(nbx);
    ds_list_destroy(nby);
}
