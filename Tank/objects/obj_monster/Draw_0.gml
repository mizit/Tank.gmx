/*with (obj_free_ground)
{
    if (ready)
    {
        for (var i = 0; i < instance_number(obj_pillar) - 1; i++)
        {
            if ((pillars[i].x < other.x) && (pillars[i + 1].x > other.x))
            {
                other.my_image_angle = point_direction(pillars[i].x, pillars[i].y, 
                pillars[i + 1].x, pillars[i + 1].y);
                break;
            }
        }
    }
}*/
if (status & LEFT)
{
    draw_sprite_ext(sprite_index, -1, x, y, -1, 1, 
    my_image_angle, c_white, 1);
}
else
{
    draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 
    my_image_angle, c_white, 1);
}


