// Tile
var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));

var _x = floor(x/32);
var _y = floor(y/32);

// Player Collision
var _cx = x + (32 * image_xscale);
var _cy = y + 10;
if collision_rectangle(x, y - 1, _cx, _cy, obj_player, false, true)
{	
	was_stepped_on = true;
}

// Countdown
if (was_stepped_on)
{
	// Increase Alpha
	if (timer_ticks % 30 == 0)
	{
		image_alpha += 0.15;
	}
	
	// If Timer Ends
	if (timer_ticks <= 0)
	{
		is_showing_platform = false;
		image_alpha = 0;
	}
	
	// Decrease Timer
	timer_ticks -= 1;
	
	if (timer_ticks <= -120)
	{
		is_showing_platform = true;
		was_stepped_on = false;
		timer_ticks = 120;
	}
}

// Show the Platform
if (is_showing_platform)
{
	if (abs(image_xscale) == 2)
	{
		tilemap_set(_tl_main, 18, _x, _y);
		tilemap_set(_tl_main, 19, _x + 1, _y);
	}
	else
	{
		for (var _i = 0; _i < abs(image_xscale); _i++)
		{
			tilemap_set(_tl_main, 20, _x + _i, _y);
		}
	}
}
else
{
	for (var _i = 0; _i < abs(image_xscale); _i++)
	{
		tilemap_set(_tl_main, 0, _x + _i, _y);
	}
}