#macro HTML_BUILD false
#macro HTML:HTML_BUILD true
#macro DEV_MODE false
#macro Developer:DEV_MODE true
#macro GRAVITY_SPEED 0.25

#macro FONT_HEIGHT 27
#macro FONT_WIDTH 21

// Globals
global.window_width = 0;
global.window_height = 0;
global.do_swap_controls = false;
global.levels_complete = [];

//	rm_level_01, rm_level_02, rm_level_03, rm_level_04, rm_level_05, rm_level_06, rm_level_07

// Font Func
function f_draw_text_font(x, y, _text, _size = 1, _color = c_white, _valign = fa_top, _halign = fa_left, _font = fnt_silver){
	// Set Values
	draw_set_font(_font);
	draw_set_color(_color);
	draw_set_valign(_valign);
	draw_set_halign(_halign);
	// World Size Value is .167
	
	// Draw Text
	draw_text_transformed_color(x, y, _text, _size, _size, 0, _color, _color, _color, _color, 1);
	
	// Reset Font
	draw_set_font(fnt_silver);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
}

// Swap Bool
function f_swap_bool(_bool)
{
	if !_bool return true;
	if _bool return false;
}

// Check Deaths
function f_check_deaths_under_allowed()
{
	with (obj_player)
	{
		if (allowed_deaths != -1)
		{
			if (deaths <= allowed_deaths)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return true;
		}
	}
}

// Draw a Message to Screen
function f_show_message(_text, _t_sec = 2, _is_warning = true)
{
	if (instance_exists(obj_game_manager))
	{
		with (obj_game_manager)
		{
			text = _text;
			timer_ticks = game_get_speed(gamespeed_fps) * _t_sec;
			if (_is_warning)
			{
				color = c_red;
				color_accent = c_maroon;
			}
			else
			{
				color = c_white;
				color_accent = c_gray;
			}
		}
	}
}