function f_special_condition()
{
	var _corpse = collision_circle(x, y, 8, obj_corpse, false, true);
	if (_corpse)
	{
		image_alpha = 1;
		sprite_index = spr_player_dead;
		
		var _tl_main = layer_tilemap_get_id(layer_get_id("Tiles"));
		tilemap_set(_tl_main, 22, 3, 6);
		
		instance_destroy(_corpse);
	}
}