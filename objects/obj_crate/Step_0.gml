event_inherited();

var _entity = collision_circle(x, y + 4, 9, obj_pawn_entity, false, true);
if (_entity)
{
	speed_x = _entity.speed_x * 1.2;
}
else
{
	speed_x = 0;
}