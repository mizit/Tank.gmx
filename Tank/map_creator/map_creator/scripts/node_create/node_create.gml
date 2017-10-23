/// @description creating node with obj_shoulder
/// @param x
/// @param y
/// @return node

var tmp = instance_create_depth(argument0, argument1, 0, obj_node);
var shld1 = instance_create_depth(argument0 - SHOULDER_DISTANCE, argument1, 0, obj_shoulder);
var shld2 = instance_create_depth(argument0 + SHOULDER_DISTANCE, argument1, 0, obj_shoulder);
shld1.owner = tmp;
shld2.owner = tmp;
shld1.another = shld2;
shld2.another = shld1;
shld1.dir = 180;
tmp.shoulder1 = shld1;
tmp.shoulder2 = shld2;
return tmp;