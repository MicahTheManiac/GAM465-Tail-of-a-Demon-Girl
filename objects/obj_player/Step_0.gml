event_inherited();

// Input
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_up = keyboard_check(vk_space) or keyboard_check(vk_up) or keyboard_check(ord("W"));
var _key_atk_left = keyboard_check(ord("Q")) or keyboard_check(vk_left);
var _key_atk_right = keyboard_check(ord("E")) or keyboard_check(vk_right);
var _key_restart = keyboard_check(ord("R"));
var _key_menu = keyboard_check(ord("M")) or keyboard_check(vk_escape);
var _key_pull = keyboard_check(ord("S")) or keyboard_check(vk_down);

// Alternate Controls
if (global.do_swap_controls)
{
	_key_left = keyboard_check(vk_left);
	_key_right = keyboard_check(vk_right);
	_key_atk_left = keyboard_check(ord("A"));
	_key_atk_right = keyboard_check(ord("D"));
}

if (_key_restart) and (!_key_menu)
{
	halo_alpha++;
	
	if (halo_alpha >= 120)
	{
		halo_alpha = 0;
		deaths = 0;
		room_restart();
	}
}
else if (_key_menu) and (!_key_restart)
{
	halo_alpha++;
	
	if (halo_alpha >= 120)
	{
		halo_alpha = 0;
		room_goto(rm_hub);
	}
}
else
{
	halo_alpha = 0;
}

// Pull Crates
var _crate = collision_circle(x, y, 64, obj_crate, false, false);
if (_key_pull) and (_crate)
{
	var _dir = point_direction(_crate.x, _crate.y, x, y);
	if (_dir < 60) or (_dir > 300)
	{
		_crate.speed_x += 1;
	}
	else if (_dir < 210) and (_dir > 120)
	{
		_crate.speed_x -= 1;
	}
}

// Calculate Movement
var _move_x = _key_right - _key_left;
var _attack = _key_atk_right - _key_atk_left;
speed_x = _move_x * speed_move;

// Check if we are on ground before Jump
if (is_on_ground) and (_key_up) and (!is_attacking)
{
	speed_y = -5.8;
	audio_play_sound(snd_jump, 1, false);
}

// Attacking
if (_attack != 0) and (!is_attacking) and (is_on_ground) and (!_key_up)
{
	is_attacking = true;
	attack_direction = _attack;
	
}

// Death
if (health_current <= 0) and (!is_dead)
{
	is_dead = true;
	deaths += 1;
	instance_create_layer(x, y + 10, "InstancesPlayer", obj_corpse);
}

if (is_dead)
{
	// Prevent Movement
	speed_x = 0;
	speed_y = 0;
	
	// Prevent Restart or Exit
	//halo_alpha = 0;
	
	// Countdown Death Timer
	timer_death_ticks -= 1;
	
	// If Ticks are Zero
	if (timer_death_ticks <= 0)
	{
		timer_death_seconds -= 1;
		timer_death_ticks = game_get_speed(gamespeed_fps);
		health_current += clamp(int64(health_max / timer_death_seconds_start) + 1, 0, health_max);
	}
	
	// If Seconds are Zero
	if (timer_death_seconds <= 0) and (f_check_deaths_under_allowed())
	{
		x = xstart;
		y = ystart;
		health_current = health_max
		is_dead = false;
		timer_death_ticks = game_get_speed(gamespeed_fps);
		timer_death_seconds = timer_death_seconds_start;
	}
}