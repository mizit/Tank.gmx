/// @description friction for any value
/// @param speed
/// @param friction
/// @retrun new speed

var l_spd = argument0;
var l_frc = argument1;

if (l_spd > 0)
{
	l_spd = max(0, l_spd - l_frc);
}
else
{
	l_spd = min(0, l_spd + l_frc);
}

return l_spd;