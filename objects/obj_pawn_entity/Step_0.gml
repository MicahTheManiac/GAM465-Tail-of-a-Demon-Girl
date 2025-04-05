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

if (place_meeting(x, y + speed_y * 1.1, _tl_main))
{
	while (!place_meeting(x, y + sign(speed_y), _tl_main))
	{
		y += sign(speed_y);
	}
	speed_y = 0;
	is_on_ground = true;
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


if (do_entity_collision) and (place_meeting(x, y + speed_y * 1.1, obj_pawn_entity))
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

// Attacks
if (is_attacking) and (!is_dead) and (is_on_ground)
{
	speed_x = 0;
	timer_attack -= 1;
	
	var _atk_dir = (attack_direction * 90) - 90;
	var _ax = x + lengthdir_x(attack_range, _atk_dir);
	var _ay = y + lengthdir_y(attack_range, _atk_dir);
	var _h = sprite_height / 2;
	//	var _entity = collision_line(x, y, _ax, _ay, obj_pawn_entity, false, true);
	var _entity = collision_rectangle(x, y - _h, _ax, y + _h, obj_pawn_entity, false, true);
	if (_entity) and (!do_attack_cooldown)
	{
		_entity.f_do_damage(other.damge_dealt);
	}
	
	if (!do_attack_animation)
	{
		image_index = 0;
		do_attack_animation = true;
	}
	
	if (timer_attack <= 0)
	{
		is_attacking = false;
		do_attack_animation = false;
		do_attack_cooldown = f_swap_bool(do_attack_cooldown);
		timer_attack = timer_attack_frames;
	}
}
else if (is_attacking) and (is_dead)
{
	is_attacking = false;
	do_attack_animation = false;
	timer_attack = timer_attack_frames;
}
else if (!is_attacking)
{
	is_attacking = false;
	do_attack_animation = false;
	do_attack_cooldown = false;
	timer_attack = timer_attack_frames;
}

// If we are Hit
if (is_hit)
{
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
}

// Death
if (is_implementing_ai) and (health_current == 0) and (!is_dead)
{
	// Switch State to Dead
	state = AI_STATE.DIE;
}

// Apply Movement
x += speed_x;
y += speed_y;