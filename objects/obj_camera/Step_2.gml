// Set View 0 to Desired Resolution
#macro VIEW view_camera[0]
camera_set_view_size(VIEW, view_width, view_height);

// Follow the Target and Prevent Camera from Leaving Room
if (instance_exists(target))
{
	// Clamp Positions
	var _x = clamp(target.x - view_width / 2, 0, room_width - view_width);
	var _y = clamp(target.y - view_height / 2, 0, room_height - view_height);
	
	// Get Current Positions
	var _cx = camera_get_view_x(VIEW);
	var _cy = camera_get_view_y(VIEW);
	
	// Set View Position
	camera_set_view_pos(VIEW, lerp(_cx, _x, 0.1), lerp(_cy, _y, 0.1))
	
}
else if (instance_exists(obj_player))
{
	target = obj_player;
}
// Else Center Camera to Room
else
{
	var _x = (room_width / 2) - (view_width / 2);
	var _y = (room_height / 2) - (view_height / 2);
	camera_set_view_pos(VIEW, _x, _y);
}