draw_self();

var _attk = sprites[0];
var _idle = sprites[1];
var _walk = sprites[2];

mask_index = _idle;
image_xscale = 1;

// If we are Hit
if (is_hit)
{
	image_blend = c_red;
}
else
{
	image_blend = c_white;
}

// If we are Moving
if (speed_x != 0)
{
	sprite_index = _walk
	
	if (speed_x < 0) and ((point_direction(x, y, target.x, target.y) > 95) or (state != AI_STATE.ATTACK))
	{
		image_xscale = -1;
	}
}

// Idle
if (speed_x == 0)
{
	sprite_index = _idle;
}

// If we are Attcking
if (is_attacking) and (!do_attack_cooldown)
{
	sprite_index = _attk;
	if (point_direction(x, y, target.x, target.y) > 90) and (point_direction(x, y, target.x, target.y) < 270)
	{
		image_xscale = -1;
	}
}