// Draw Frequency Sprite
var  _freq = frequency;
if (frequency < 0) _freq = 4;

if (!is_pressed)
{
	draw_sprite(spr_button, 3 + _freq, x, y);
}

// Allow Children to Run their own code