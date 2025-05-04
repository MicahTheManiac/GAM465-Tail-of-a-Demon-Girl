if (room == rm_dev) level_name = "Dev Room";
f_draw_text_font(global.window_width / 2, global.window_height - (2 * FONT_HEIGHT), $"> {level_name} <", 2, c_white, fa_middle, fa_center);

// Coins
if (do_count_coins)
{
	var _string = $"Heart Coins: {coins} out of 3";
	var _str_len = string_width(_string)
	f_draw_text_font(global.window_width - _str_len - 30, 21, _string);
}

// Draw Message
if (timer_ticks > 0)
{
	timer_ticks -= 1;
	f_draw_text_font((global.window_width / 2) + 2, (global.window_height / 2) + 2, text, 2, color_accent, fa_middle, fa_center);
	f_draw_text_font((global.window_width / 2), (global.window_height / 2), text, 2, color, fa_middle, fa_center);
}