/// @description return correct link in energy_arr
/// @param pos
/// @return link

if ((argument0 < 0) || (argument0 > 2))
{
	show_message("item_owners_energy_link error");
	return noone;
}
else
{
	return -(argument0 + 1);
}