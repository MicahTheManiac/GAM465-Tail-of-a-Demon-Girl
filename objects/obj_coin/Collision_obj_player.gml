if (other.allowed_deaths > -1)
{
	other.allowed_deaths += 1;
}

other.health_current = other.health_max;

with(obj_game_manager)
{
	coins += 1;
}

instance_destroy(id);