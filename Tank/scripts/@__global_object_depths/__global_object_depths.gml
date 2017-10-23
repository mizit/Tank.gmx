// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // obj_ground
global.__objectDepths[1] = 0; // obj_pillar
global.__objectDepths[2] = 0; // obj_wall_slope
global.__objectDepths[3] = 0; // obj_wall_half
global.__objectDepths[4] = -100; // obj_free_ground
global.__objectDepths[5] = 0; // obj_bullet_old
global.__objectDepths[6] = 0; // obj_wheel
global.__objectDepths[7] = -150; // obj_bullet
global.__objectDepths[8] = 0; // obj_gg
global.__objectDepths[9] = 0; // obj_geer
global.__objectDepths[10] = 0; // obj_room_med
global.__objectDepths[11] = 0; // obj_human
global.__objectDepths[12] = 0; // obj_room_half2
global.__objectDepths[13] = 0; // obj_room_half1
global.__objectDepths[14] = 0; // obj_room
global.__objectDepths[15] = -2; // obj_base_gun
global.__objectDepths[16] = -1; // obj_small_gun
global.__objectDepths[17] = 0; // obj_player
global.__objectDepths[18] = 1; // obj_tank
global.__objectDepths[19] = 1; // obj_tank_second
global.__objectDepths[20] = -5; // obj_tower
global.__objectDepths[21] = 0; // obj_carner_mid
global.__objectDepths[22] = 0; // obj_smoke_effect
global.__objectDepths[23] = 0; // obj_info
global.__objectDepths[24] = -1; // obj_carner_tail
global.__objectDepths[25] = 0; // obj_navigation
global.__objectDepths[26] = -15; // obj_test_fire
global.__objectDepths[27] = 0; // obj_monster_part
global.__objectDepths[28] = 0; // obj_monster_frag
global.__objectDepths[29] = -1; // obj_carner
global.__objectDepths[30] = 0; // obj_carner_frag1
global.__objectDepths[31] = 0; // obj_carner_frag3
global.__objectDepths[32] = 0; // obj_monster
global.__objectDepths[33] = 0; // obj_carner_frag2


global.__objectNames[0] = "obj_ground";
global.__objectNames[1] = "obj_pillar";
global.__objectNames[2] = "obj_wall_slope";
global.__objectNames[3] = "obj_wall_half";
global.__objectNames[4] = "obj_free_ground";
global.__objectNames[5] = "obj_bullet_old";
global.__objectNames[6] = "obj_wheel";
global.__objectNames[7] = "obj_bullet";
global.__objectNames[8] = "obj_gg";
global.__objectNames[9] = "obj_geer";
global.__objectNames[10] = "obj_room_med";
global.__objectNames[11] = "obj_human";
global.__objectNames[12] = "obj_room_half2";
global.__objectNames[13] = "obj_room_half1";
global.__objectNames[14] = "obj_room";
global.__objectNames[15] = "obj_base_gun";
global.__objectNames[16] = "obj_small_gun";
global.__objectNames[17] = "obj_player";
global.__objectNames[18] = "obj_tank";
global.__objectNames[19] = "obj_tank_second";
global.__objectNames[20] = "obj_tower";
global.__objectNames[21] = "obj_carner_mid";
global.__objectNames[22] = "obj_smoke_effect";
global.__objectNames[23] = "obj_info";
global.__objectNames[24] = "obj_carner_tail";
global.__objectNames[25] = "obj_navigation";
global.__objectNames[26] = "obj_test_fire";
global.__objectNames[27] = "obj_monster_part";
global.__objectNames[28] = "obj_monster_frag";
global.__objectNames[29] = "obj_carner";
global.__objectNames[30] = "obj_carner_frag1";
global.__objectNames[31] = "obj_carner_frag3";
global.__objectNames[32] = "obj_monster";
global.__objectNames[33] = "obj_carner_frag2";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for