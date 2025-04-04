if (place_meeting(x, y, obj_pawn_entity))
{
	// If we're not pressed.
	if (!is_pressed)
	{
		is_pressed = true;
	}
}
else
{
	is_pressed = false;
}