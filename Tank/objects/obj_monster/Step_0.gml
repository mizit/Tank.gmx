/*if (phy_speed_x > 0)
{
    status &= ~LEFT;
}
if (phy_speed_x < 0)
{
    status |= LEFT;
}
*/
if (hp <= 0) && (behavior != DEAD)
{
    sprite_index = death_sprite;
    image_index = 0;
    image_speed = 1;
    behavior = DEAD;
    for (var i = 0; i < ds_list_size(monster_parts); i++)
    {
        monster_parts[| i].sprite_index = monster_parts[| i].death_sprite;
    }
    for (var i = 0; i < ds_list_size(monster_frags); i++)
    {
        instance_create(x, y, monster_frags[| i]);
    }
}

/* */
/*  */
