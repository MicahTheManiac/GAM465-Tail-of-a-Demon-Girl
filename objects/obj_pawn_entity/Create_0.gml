// AI States
enum AI_STATE
{
	IDLE,
	ROAM,
	CHASE,
	ATTACK,
	DIE
}

state = AI_STATE.IDLE;

speed_x = 0;
speed_y = 0;
speed_grav = GRAVITY_SPEED;
speed_move = 0.5;
roam_x = xstart;

sprites = [];

health_current = 10;
health_max = 10;
attack_direction = 0;
attack_range = 48;
detect_range = 128;
damage_dealt = 5;
target = noone;

timer_attack_frames = 0;
timer_attack = timer_attack_frames;
timer_hit_ticks = 30;
timer_hit = timer_hit_ticks;
timer_hit_cooldown = 0;
timer_random_ticks = irandom_range(100, 600);
timer_random = 0;

do_attack_animation = false;
do_hit_cooldown = false;
do_hit_sound = false;
do_entity_collision = true;
has_attempted_hit = false;
is_implementing_ai = false;
is_attacking = false;
is_on_ground = false;
is_dead = false;
is_hit = false;

function f_do_damage(_damage_dealt)
{
	if (!is_hit)
	{
		health_current -= _damage_dealt;
		is_hit = true;
	}
}

function f_ai_move(_x, _y)
{
	var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));
	var _dir = point_direction(x, y, _x, _y);
	var _lx = lengthdir_x((sprite_width / 2), _dir)
	speed_x = lengthdir_x(speed_move, _dir);
	
	if (!place_meeting(x + _lx, y + (sprite_height / 2) + 1, _tl_main))
	{
		_dir = -_dir;
		speed_x = 0;
	}
	
}

function f_reset_attack()
{
	is_attacking = false;
	do_attack_animation = false
	has_attempted_hit = false
	timer_attack = timer_attack_frames;
}