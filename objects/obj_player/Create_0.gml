event_inherited();

speed_grav = GRAVITY_SPEED;
speed_move = 4;

sprites =
		[
			spr_player_attack,
			spr_player_fall,
			spr_player_fall_dir,
			spr_player_idle,
			spr_player_jump,
			spr_player_jump_dir,
			spr_player_walk,
		];

health_current = 25;
health_max = 25;

var _frame_quotient = sprite_get_speed(spr_player_attack) div (sprite_get_number(spr_player_attack) - 1);
timer_attack_frames = (game_get_speed(gamespeed_fps) div _frame_quotient);
timer_death_seconds_start = 3;
timer_death_seconds = timer_death_seconds_start;
timer_death_ticks = game_get_speed(gamespeed_fps);
timer_hit_cooldown = timer_hit_ticks * 2;