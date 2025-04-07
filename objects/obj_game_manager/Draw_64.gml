if (room == rm_dev) level_name = "Dev Room";
f_draw_text_font(global.window_width / 2, global.window_height - (2 * FONT_HEIGHT), $"> {level_name} <", 2, c_white, fa_middle, fa_center);

if (player != noone) and (player.allowed_deaths > -1)
{
	f_draw_text_font(30, 21, $"\nDeaths: {player.deaths} out of {player.allowed_deaths}");
	
	// Fail Screen
	if (!f_check_deaths_under_allowed())
	{
		draw_sprite(spr_fail, 0, global.window_width/2, global.window_height/2);
		f_draw_text_font(global.window_width/2, 21, $"{int64((player.halo_alpha / 120) * 100)}%\nRestart Level", 1, c_ltgray, fa_top, fa_center);
	}
}

// Draw Message
if (timer_ticks > 0)
{
	timer_ticks -= 1;
	f_draw_text_font(global.window_width / 2, global.window_height / 2, text, 2, c_white, fa_middle, fa_center);
}