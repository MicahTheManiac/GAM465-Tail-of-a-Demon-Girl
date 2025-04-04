timer_ticks -= 1;

if (timer_ticks <= 0)
{
	timer_ticks = game_get_speed(gamespeed_fps);
	timer_seconds -= 1;
}

if (timer_seconds <= 0)
{
	with(instance_create_layer(x, y, "Instances", projectile))
	{
		direction = other.direction;
	}
	timer_seconds = timer_seconds_start;
}