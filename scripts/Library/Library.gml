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

// Button Test
function f_button_test()
{
	show_debug_message(" > Button Working")
}

// Swap Controls
function f_button_swap_keys()
{
	global.do_swap_controls = f_swap_bool(global.do_swap_controls);
	room_restart();
}