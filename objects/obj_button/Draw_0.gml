draw_self();

var _freq = frequency;
if (frequency == -1) _freq = 4;

var _color = colors[_freq][0];
var _subimage = 1;

if (is_pressed) and (frequency >= 0)
{
	_color = colors[_freq][1];
	_subimage = 2;
}

draw_sprite_ext(spr_button, _subimage, x, y, 1, 1, image_angle, _color, 1);
draw_sprite(spr_button, 3 + _freq, x, y);