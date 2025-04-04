is_pressed = false;
frequency = clamp(frequency, -1, 3);

activators = [];

function f_find_activators()
{
	var _obj = obj_pawn_activator;
	for (var _i = 0; _i < instance_number(_obj); _i++)
	{
		var _inst = instance_find(_obj, _i);
		if (_inst.frequency == frequency)
		{
			array_push(activators, _inst);
		}
	}
}

function f_get_activator_state()
{
	var _active_activators = 0;
	for (var _i = 0; _i < array_length(activators); _i++)
	{
		if (activators[_i].is_pressed)
		{
			_active_activators += 1;
		}
	}
	
	if (_active_activators == array_length(activators))
	{
		is_pressed = true;
	}
	else
	{
		is_pressed = false;
	}
}