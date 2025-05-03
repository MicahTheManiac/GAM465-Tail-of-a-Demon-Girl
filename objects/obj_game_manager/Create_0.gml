player = instance_nearest(x, y, obj_player);
text = "";
timer_ticks = 0;
color = c_red;
color_accent = c_maroon;
coins = 0;

// Set Cursor
if (room == rm_credits) or (room == rm_hub)
{
	window_set_cursor(cr_arrow);
}
else
{
	window_set_cursor(cr_none);
}