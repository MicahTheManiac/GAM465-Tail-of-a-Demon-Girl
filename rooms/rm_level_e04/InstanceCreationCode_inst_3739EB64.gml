function f_special_condition()
{
	var _wall = collision_line(x - 16, y, room_width + 16, y, obj_spikes, false, true);
	
	if (instance_exists(obj_player)) and (obj_player.is_dead) and (_wall)
	{
		_wall.x = obj_player.xstart - 128;
	}
}