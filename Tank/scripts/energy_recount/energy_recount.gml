/// @description recount energy_max and energy_current
energy_max = 0;
for (var i = 0; i < 3; i++)
{
	if (energy_arr[i] != noone)
	{
		energy_max += energy_arr[i].module_energy;
	}
}
if (energy_max < energy_consuming())
{
	energy_overload();
}
energy_current = energy_max - energy_construct - energy_support - energy_weapon;