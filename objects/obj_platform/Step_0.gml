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
	if (abs(image_xscale) == 2)
	{
		tilemap_set(_tl_main, 5, _x, _y);
		tilemap_set(_tl_main, 6, _x + 1, _y);
	}
	else
	{
		for (var _i = 0; _i < abs(image_xscale); _i++)
		{
			tilemap_set(_tl_main, 7, _x + _i, _y);
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