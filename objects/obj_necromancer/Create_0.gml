event_inherited();

sprites = [spr_necromancer_attack, spr_necromancer_idle, spr_necromancer_walk];
sprite_prefetch_multi(sprites);

health_max = 15;
health_current = health_max;

attack_range = 48;
detect_range = 256;

damage_dealt = 8;

timer_attack_frames = 75;
target = obj_player;

do_entity_collision = false;