// Button Test
function f_button_test()
{
	show_debug_message(" > Button Working")
}

// Swap Controls
function f_button_swap_keys()
{
	global.do_swap_controls = f_swap_bool(global.do_swap_controls);
	//room_restart();
}

// Fullscreen Button
function f_button_fullscreen()
{
	// Make sure Camera exists
	if (instance_exists(obj_camera))
	{
		obj_camera.f_camera_fullscreen();
	}
}