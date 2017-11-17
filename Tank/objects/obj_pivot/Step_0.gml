if (mouse_check_button(mb_left))
{
	tbs_cnt++;
	if (tbs_cnt >= tbs)
	{
		tbs_cnt = 0;
		gun_list[gun_cnt].fire = 1;
		gun_cnt++;
		if (gun_cnt >= gun_num)
		{
			gun_cnt = 0;
		}
	}
}
else
{
	if (tbs_cnt < tbs)
	{
		tbs_cnt++;
	}
}