// Begin Smoke and Mirrors
do_end_cutscene = true;
obj_camera.target = id;
obj_game_manager.level_name = "The End"
other.allowed_deaths = -1;
instance_create_layer(other.x, other.y, "InstancesPlayer", obj_corpse, {sprite_index : spr_player_idle});
instance_deactivate_object(other);
instance_deactivate_object(obj_scorpion);
instance_deactivate_object(obj_necromancer);