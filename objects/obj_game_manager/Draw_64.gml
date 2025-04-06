if (room == rm_dev) level_name = "Dev Room";
f_draw_text_font(global.window_width / 2, global.window_height - (2 * FONT_HEIGHT), $"> {level_name} <", 2, c_white, fa_middle, fa_center);

if (player != noone) and (player.allowed_deaths > -1)
{
	f_draw_text_font(30, 21, $"\nDeaths: {player.deaths} out of {player.allowed_deaths}");
}