var _health_ratio = clamp(health_current / health_max, 0, 1);
var _scale = 20 * _health_ratio;
draw_sprite_ext(spr_ui_meter, 0, 20, 20, 20, 2, 0, c_white, 1);
draw_sprite_ext(spr_ui_meter, 1, 20.5, 20, _scale, 2, 0, make_color_rgb(255, 72, 72), 1);

f_draw_text_font(30, 21, $"Health: {health_current}", 1);