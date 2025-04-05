sprite_prefetch_multi(sprites);
draw_self();

mask_index = spr_player_idle;
image_xscale = 1;
image_yscale = 1;

// Movement Animations
if (is_on_ground)
{
	// If we are Moving
	if (speed_x != 0) and (!is_attacking) and (!is_hit)
	{
		sprite_index = spr_player_walk;
		image_xscale = clamp(speed_x, -1, 1);
	}
	
	// If we are Idle
	if (speed_x == 0) and (!is_attacking) and (!is_hit)
	{
		sprite_index = spr_player_idle;
	}
	
	// If we are Attcking
	if (is_attacking)
	{
		sprite_index = spr_player_attack;
		image_xscale = clamp(attack_direction, -1, 1);
	}
	
}
else if (!is_on_ground) and (!is_hit)
{
	// If we are Falling
	if (speed_y > 0.5) {
		sprite_index = spr_player_fall;
		
		// If we are moving
		if (speed_x != 0)
		{
			sprite_index = spr_player_fall_dir
			image_xscale = clamp(speed_x, -1, 1);
		}
		
	}
	// Else.. We are Jumping
	else
	{
		sprite_index = spr_player_jump;
		
		// If we are moving
		if (speed_x != 0)
		{
			sprite_index = spr_player_jump_dir
			image_xscale = clamp(speed_x, -1, 1);
		}
	}
}

if (is_hit) and (!is_attacking)
{
	sprite_index = spr_player_hit;
}

// Death
if (!is_dead)
{
	image_alpha = 1;
}
else
{
	image_alpha = 0;
}

// Halo
var _alpha = clamp(halo_alpha / 100, 0, 1);
draw_sprite_ext(spr_player_halo, 0, x, y, 1, 1, 0, c_white, _alpha);