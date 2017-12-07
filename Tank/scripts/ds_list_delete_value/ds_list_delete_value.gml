/// @description deleting cell with special value from list
/// @param id list
/// @param value

var l_pos = ds_list_find_index(argument0, argument1);
ds_list_delete(argument0, l_pos);