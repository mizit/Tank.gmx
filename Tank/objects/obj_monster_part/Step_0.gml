if (owner)
{
    if (behavior == STUN)
    {
        owner.behavior = STUN;
        behavior = WALK;
    }
    if (hp <= 0)
    {
        owner.hp += hp;
    }
}

