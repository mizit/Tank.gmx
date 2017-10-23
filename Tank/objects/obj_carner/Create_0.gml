event_inherited();
//phy_fixed_rotation = 1;
my_power = 512;
death_sprite = s_carner_death;

behavior = WALK;
attack_distance = 170;
attack_x = 50;
attack_y = -30;
attack_power = 2000;

hp = 30;


middle = noone;
m_offset = 30;
tail = noone;
t_offset = 57;
if (obj_gg.x < x)
{
    middle = instance_create(x + m_offset, y, obj_carner_mid);
    physics_joint_distance_create(id, middle, x, y, middle.x, middle.y, 0);
    tail = instance_create(x + t_offset, y, obj_carner_tail);
    physics_joint_distance_create(middle, tail, middle.x, middle.y, tail.x, tail.y, 0);
}
else
{
    middle = instance_create(x - m_offset, y, obj_carner_mid);
    physics_joint_distance_create(id, middle, x, y, middle.x, middle.y, 0);
    tail = instance_create(x - t_offset, y, obj_carner_tail);
    physics_joint_distance_create(middle, tail, middle.x, middle.y, tail.x, tail.y, 0);
}
middle.owner = id;
tail.owner = middle;
ds_list_add(monster_parts, middle, tail);

ds_list_add(monster_frags, obj_carner_frag1, obj_carner_frag2, obj_carner_frag3);

stun_time = 30;
stun_counter = 0;

