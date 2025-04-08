// Tile
var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));

// Calculate Movement & Gravity
speed_x = lengthdir_x(speed_move, direction);
speed_y = lengthdir_y(speed_move, direction);
speed_y += speed_grav;

// Calculate Collision
if (place_meeting(x + speed_x, y, _tl_main))
{
	while (!place_meeting(x + sign(speed_x), y, _tl_main))
	{
		x += sign(speed_x);
	}
	speed_x = 0;
	speed_y = 0;
	
	// Destory if Fireball
	if (object_index = obj_fireball)
	{
		instance_create_layer(x, y, "Instances", obj_smoke);
		instance_destroy(id);
	}
}

if (place_meeting(x, y + speed_y, _tl_main))
{
	while (!place_meeting(x, y + sign(speed_y), _tl_main))
	{
		y += sign(speed_y);
	}
	speed_x = 0;
	speed_y = 0;
	
	// Destory if Fireball
	if (object_index = obj_fireball)
	{
		instance_create_layer(x, y, "Instances", obj_smoke);
		instance_destroy(id);
	}
}

// If Outside Room
if (y > room_height)
{
	instance_destroy(id);
}

// Apply Movement
x += speed_x;
y += speed_y;