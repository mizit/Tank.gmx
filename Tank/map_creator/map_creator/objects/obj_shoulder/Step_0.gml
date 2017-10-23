event_inherited();
if (dnd) && (owner)
{
	dis = point_distance(owner.x, owner.y, x, y);
	dir = point_direction(owner.x, owner.y, x, y);
	with (another)
	{
		dir = 180 + other.dir;
		x = owner.x + lengthdir_x(dis, dir);
		y = owner.y + lengthdir_y(dis, dir);
	}
}