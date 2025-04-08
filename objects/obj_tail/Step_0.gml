y = f_wave(ystart - 5, ystart + 5, 10, 0);

if (do_end_cutscene) and (scene_alpha == 1)
{
	timer_ticks++;
	if (timer_ticks == 240)
	{
		//instance_activate_object(obj_player);
		room_goto(rm_credits);
	}
}