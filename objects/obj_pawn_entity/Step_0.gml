// Tile
var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));

// Clamp Health
health_current = clamp(health_current, 0, health_max);

// Calculate Gravity
speed_y += speed_grav;

// Calculate Collision
if (place_meeting(x + speed_x * 1.1, y, _tl_main))
{
	while (!place_meeting(x + sign(speed_x), y, _tl_main))
	{
		x += sign(speed_x);
	}
	speed_x = 0;
}
//	-	Block Collision on Top and Bottom
if (place_meeting(x, y + speed_y * 1.1, _tl_main))
{
	while (!place_meeting(x, y + sign(speed_y), _tl_main))
	{
		y += sign(speed_y);
	}
	
	// Checking if going down (+)
	if (speed_y > 0)
	{
		speed_y = 0;
		is_on_ground = true;
	}
	else
	{
		speed_y = 0;
	}
}
else
{
	is_on_ground = false;
}

// Entity Collision
if (do_entity_collision) and (place_meeting(x + speed_x * 1.1, y, obj_pawn_entity))
{
	while (!place_meeting(x + sign(speed_x), y, obj_pawn_entity))
	{
		x += sign(speed_x);
	}
	speed_x = 0;
}

//	-	Allows clipping through underneath entities
if (do_entity_collision) and (place_meeting(x, y + speed_y, obj_pawn_entity)) and (speed_y > 0)
{
	while (!place_meeting(x, y + sign(speed_y), obj_pawn_entity))
	{
		y += sign(speed_y);
	}
	speed_y = 0;
	is_on_ground = true;
}

// Kill if below Level
if (y > room_height) and (!is_dead)
{
	health_current = 0;
}

// Attacking
if (is_attacking) and (is_on_ground) and (!is_dead)
{
	// Decrease Timer
	timer_attack -= 1;
	
	// Halt Speed
	if (object_index != obj_player) speed_x = 0;
	else speed_x = clamp(speed_x, -0.35, 0.35);
	
	// Get Attack Direction
	var _atk_dir = (attack_direction * 90) - 90;
	var _ax = x + lengthdir_x(attack_range * 1.2, _atk_dir);
	
	// Get Collision
	var _entity = collision_rectangle(x, y - 24, _ax, y + 24, obj_pawn_entity, false, true);
	if (_entity) and (!has_attempted_hit)
	{
		_entity.f_do_damage(other.damage_dealt);
	}
	
	// We attempted a hit
	if (!has_attempted_hit) has_attempted_hit = true;
	
	// Do Attack Animation
	if (!do_attack_animation)
	{
		image_index = 0;
		do_attack_animation = true;
	}
	
	// Reset
	if (timer_attack <= 0) f_reset_attack();
}

// If we are Hit
if (is_hit)
{
	// Cooldown
	timer_hit -= 1;
	if (timer_hit <= 0) and (!do_hit_cooldown)
	{
		do_hit_cooldown = f_swap_bool(do_hit_cooldown);
		timer_hit = timer_hit_cooldown;
		is_hit = false;
	}
	else if (timer_hit <= 0) and (do_hit_cooldown)
	{
		do_hit_cooldown = f_swap_bool(do_hit_cooldown);
		timer_hit = timer_hit_ticks;
		is_hit = false;
	}
	
	// Sound
	if (!do_hit_sound)
	{
		do_hit_sound = true;
		if (!audio_is_playing(snd_hit)) audio_play_sound(snd_hit, 1, false, 0.5);
	}
}
else
{
	do_hit_sound = false;
}

// Death
if (is_implementing_ai) and (health_current == 0) and (!is_dead)
{
	// Switch State to Dead
	state = AI_STATE.DIE;
	
	// Reset Attack
	f_reset_attack();
	
	// We are Dead
	is_dead = true;
}

// Apply Movement
x += speed_x;
y += speed_y;