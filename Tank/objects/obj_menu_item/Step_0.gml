if (instance_exists(obj_menu_eng))
{
	if (!mouse_check_button(mb_left))
	{
		item_set_dnd(id, 0, obj_menu_eng.cursor_state);
	}
}