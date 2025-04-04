event_inherited();

// Input
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));
var _key_up = keyboard_check(vk_space) or keyboard_check(vk_up) or keyboard_check(ord("W"));
var _key_atk_left = keyboard_check(ord("Q")) or (keyboard_check(vk_left));
var _key_atk_right = keyboard_check(ord("E")) or (keyboard_check(vk_right));

// Alternate Controls
if (global.do_swap_controls)
{
	_key_left = keyboard_check(vk_left);
	_key_right = keyboard_check(vk_right);
	_key_atk_left = keyboard_check(ord("A"));
	_key_atk_right = keyboard_check(ord("D"));
}

// Calculate Movement
var _move_x = _key_right - _key_left;
var _attack = _key_atk_right - _key_atk_left;
speed_x = _move_x * speed_move;

// Check if we are on ground before Jump
if (is_on_ground) and (_key_up) and (!is_attacking)
{
	speed_y = -6.5;
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
	instance_create_layer(x, y + 10, "InstancesPlayer", obj_corpse);
}

if (is_dead)
{
	// Prevent Movement
	speed_x = 0;
	speed_y = 0;
	
	// Countdown Death Timer
	timer_death_ticks -= 1;
	
	// If Ticks are Zero
	if (timer_death_ticks <= 0)
	{
		timer_death_seconds -= 1;
		timer_death_ticks = game_get_speed(gamespeed_fps);
	}
	
	// If Seconds are Zero
	if (timer_death_seconds <= 0)
	{
		x = xstart;
		y = ystart;
		health_current = health_max;
		is_dead = false;
		timer_death_ticks = game_get_speed(gamespeed_fps);
		timer_death_seconds = timer_death_seconds_start;
	}
}