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
speed_move = 1;
roam_x = xstart;

sprites = [];

health_current = 10;
health_max = 10;
attack_direction = 0;
attack_range = 32;
detect_range = 128;
damge_dealt = 5;
target = noone;

timer_attack_frames = 0;
timer_attack = timer_attack_frames;
timer_hit_ticks = 30;
timer_hit = timer_hit_ticks;
timer_hit_cooldown = 0;
timer_random_ticks = irandom_range(100, 600);
timer_random = 0;

do_attack_animation = false;
do_attack_cooldown = false;
do_hit_cooldown = false;
do_entity_collision = true;
is_implementing_ai = false;
is_attacking = false;
is_on_ground = false;
is_dead = false;
is_hit = false;

function f_do_damage(_damge_dealt)
{
	if (!is_hit)
	{
		health_current -= _damge_dealt;
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