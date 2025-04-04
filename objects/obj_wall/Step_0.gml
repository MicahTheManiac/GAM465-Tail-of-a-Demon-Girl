// Tile
var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));

event_inherited();

var _x = floor(x/32);
var _y = floor(y/32);

if (is_pressed) and (!do_show_platform)
{
	is_showing_platform = true;
}
else if (is_pressed) and (do_show_platform)
{
	is_showing_platform = false;
}
else
{
	is_showing_platform = f_swap_bool(!do_show_platform);
}

// Show the Platform
if (is_showing_platform)
{

	for (var _i = 0; _i < abs(image_yscale); _i++)
	{
		tilemap_set(_tl_main, 12, _x, _y + _i);
	}
}
else
{
	for (var _i = 0; _i < abs(image_yscale); _i++)
	{
		tilemap_set(_tl_main, 0, _x, _y + _i);
	}
}