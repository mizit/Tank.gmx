/// @description sorting nodes of x
/// @return list

var l_list = ds_list_create();
for (var i = 0; i < instance_number(obj_node); i++)
{
	ds_list_add(l_list, instance_find(obj_node, i));
}

var test = 0;
for (var i = 0; i < ds_list_size(l_list); i++)
{
	test = 0;
	for (var j = 0; j < ds_list_size(l_list) - 1; j++)
	{
		if (l_list[| j].x > l_list[| j + 1].x)
		{
			test = 1;
			var tmp = l_list[| j];
			l_list[| j] = l_list[| j + 1];
			l_list[| j + 1] = tmp;
		}
	}
	if (!test)
	{
		return l_list;
	}
}
return l_list;