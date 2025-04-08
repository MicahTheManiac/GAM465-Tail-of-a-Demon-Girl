draw_self();

// Smoke and Mirrors
if (do_end_cutscene)
{
	scene_alpha = clamp(scene_alpha + 0.05, 0, 1);
	draw_sprite_ext(spr_crate, 0, x, y, room_width / 10, room_height / 10, 0, c_black, scene_alpha);
	
	if (scene_alpha == 1)
	{
		f_show_message("\"Ah! There you are!\"", 1, false);
	}
}