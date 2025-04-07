// An Entity Implementing AI Behavior can call this Master Function
function f_implement_ai_behavior()
{
	// Shorted Names and Specify Which States are in Each Function
	var _idle = AI_STATE.IDLE;
	var _roam = AI_STATE.ROAM;
	var _chase = AI_STATE.CHASE;
	var _attack = AI_STATE.ATTACK;
	var _die = AI_STATE.DIE;
	
	is_implementing_ai = true;
	
	// State Machine
	switch(state)
	{
		case _idle:		// Idle State
		f_ai_state_idle();
		break;
		
		case _roam:		// Roaming (Seek) State
		f_ai_state_roam();
		break;
		
		case _chase:	// Chasing State
		f_ai_state_chase();
		break;
		
		case _attack:	// Attack State
		f_ai_state_attack();
		break;
		
		case _die:		// Die State
		f_ai_state_die();
		break;
	}
}

function f_ai_check_for_target(_target, _range)
{
	var _tc = collision_circle(x, y, _range, _target, false, false);
	if (_target != noone) and (instance_exists(_target)) and (_tc) and (!_target.is_dead)
	{
		// Return True: We Have Target
		return true;
	}
	else
	{
		// Return False: No Target
		return false;
	}
}

function f_ai_state_idle()
{
	// States Involved
	var _idle = AI_STATE.IDLE;
	var _roam = AI_STATE.ROAM;
	var _chase = AI_STATE.CHASE;
	
	// Check for Target
	if (f_ai_check_for_target(target, detect_range))
	{
		state = _chase;
	}
	else
	{
		timer_random += 1;
		speed_x = 0;
		
		// If our Random Timer is up
		if (timer_random == timer_random_ticks)
		{
			roam_x = x + irandom_range(-64, 64);
			timer_random = 0;
			timer_random_ticks = irandom_range(100, 600);
			state = choose(_idle, _roam);
		}
	}
}

function f_ai_state_roam()
{
	// States Involved
	var _idle = AI_STATE.IDLE;
	var _chase = AI_STATE.CHASE;
	
	// Check for Target
	if (f_ai_check_for_target(target, detect_range))
	{
		state = _chase;
	}
	else
	{
		timer_random += 1;
		f_ai_move(roam_x, y);
		
		// If we are not at that position
		if (x == roam_x)
		{
			state = _idle;
		}
		
		// If our Random Timer is up
		if (timer_random == timer_random_ticks)
		{
			roam_x = x + irandom_range(-64, 64);
			timer_random = 0;
			timer_random_ticks = irandom_range(100, 600);
			state = _idle;
		}
	}
}

function f_ai_state_chase()
{
	// States Involved
	var _idle = AI_STATE.IDLE;
	var _attack = AI_STATE.ATTACK;
	
	// Check for Target
	if (f_ai_check_for_target(target, detect_range))
	{
		f_ai_move(target.x, y);
		
		// If we are in Attack Range
		if (f_ai_check_for_target(target, attack_range))
		{
			state = _attack;
		}
	}
	else
	{
		// Else Return to Idle
		state = _idle
	}
}

function f_ai_state_attack()
{
	// States Involved
	var _chase = AI_STATE.CHASE;
	
	// Check for Target
	if (f_ai_check_for_target(target, attack_range))
	{
		is_attacking = true;
		attack_direction = (point_direction(x, y, target.x, target.y) + 90) / 90;
	}
	else if (f_ai_check_for_target(target, detect_range))
	{
		state = _chase;
	}
}

function f_ai_state_die()
{
	is_dead = true;
	instance_create_layer(x, y, "Instances", obj_smoke);
	instance_destroy(id);
}