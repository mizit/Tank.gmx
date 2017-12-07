/// @description return correct num in energy_arr
/// @param link
/// @return pos

if ((argument0 < -3) || (argument0 > -1))
{
	show_message("item_owners_energy_pos error");
	return noone;
}
else
{
	return -(argument0 + 1);
}