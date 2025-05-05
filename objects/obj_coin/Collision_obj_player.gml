if (other.allowed_deaths > -1)
{
	other.allowed_deaths += 1;
}

other.health_current = other.health_max;

with(obj_game_manager)
{
	coins += 1;
}

audio_play_sound(snd_coin, 1, false, 0.5);
instance_destroy(id);