if (!is_dead) and (other.speed_x != 0) and (other.speed_y != 0) and (!other.has_collided) and (other.owner != id)
{
	if (other.object_index != obj_fireball)
	{
		f_do_damage(other.damage_dealt);
		other.direction = 300;
		other.has_collided = true;
	}
	else
	{
		f_do_damage(other.damage_dealt);
		instance_destroy(other);
	}
}