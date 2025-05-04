var _scale_animation = f_wave(-1, 1, 2, 0);

draw_sprite_ext(spr_coin, 1, x, y, 0.5, 1, 0, c_white, 1);
draw_sprite_ext(spr_coin, 0, x, y, _scale_animation, 1, 0, c_white, 1);