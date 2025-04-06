event_inherited();

sprites = [spr_scorpion_attack, spr_scorpion_idle, spr_scorpion_walk];
sprite_prefetch_multi(sprites);

attack_range = 32;

timer_attack_frames = 30;
target = obj_player;

do_entity_collision = false;