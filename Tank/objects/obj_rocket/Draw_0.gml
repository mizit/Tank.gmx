if (!dead)
{
	draw_self();
}
for (var i = 0; i < ds_list_size(track_x) - 1; i++)
{
    draw_set_alpha(i / track_size);
    draw_line(track_x[| i], track_y[| i], track_x[| i + 1], track_y[| i + 1]);
}
draw_set_alpha(1);
if (ds_list_size(track_x) > 1)
{
    draw_line(track_x[| i], track_y[| i], phy_position_x, phy_position_y);
}

//physics_draw_debug();