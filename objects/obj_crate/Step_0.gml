event_inherited();

// Seem to have issues with allowing all entities, so only players, other entities can phase through.
var _entity = collision_circle(x, y + 4, 9, obj_player, false, true);
if (_entity)
{
	speed_x = _entity.speed_x * 0.5;
}
else
{
	speed_x = 0;
}