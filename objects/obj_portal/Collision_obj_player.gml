/*
 * Best Practice would be to have an array containing all sequential levels. (1-10)
 * But since there are only three levels, we are going to hardcode in these cases.
 * Not best practice, but is simple. (And may save computation power on a for loop.)
 */
function f_room_check_ignored()
{
	if (room != rm_dev) and (room != rm_hub) and (room != rm_template) and (room != rm_level_10)
	{
		return false;
	}
	else
	{
		return true;
	}
}

// Check Array Length
if (array_length(global.levels_complete) > 0)
{
	var _level_index = -1;
	for (var _i = 0; _i < array_length(global.levels_complete); _i++)
	{
		// If we have the current room in the list then return the index
		if (room == global.levels_complete[_i]) and (!f_room_check_ignored())
		{
			_level_index = _i
		}
	}
	
	if (_level_index == -1) and (!f_room_check_ignored())
	{
		array_push(global.levels_complete, room);
	}
}
else if (!f_room_check_ignored())
{
	array_push(global.levels_complete, room);
}

// Check if we are trying to enter Level 10
if (level_to_load == rm_level_10) and (array_length(global.levels_complete) < 4)
{
	f_show_message("You haven't completed enough levels.", 4);
}
else
{
	room_goto(level_to_load);
}