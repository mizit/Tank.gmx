image_angle = point_direction(x, y, owner.x, owner.y);
if (status & LEFT)
{
    draw_sprite_ext(sprite_index, -1, x, y, 1, -1, image_angle, c_white, 1);
}
else
{
    draw_self();
}

