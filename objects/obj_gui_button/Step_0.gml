if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
{
	image_blend = color_accent;
	
	if (mouse_check_button_pressed(mb_left))
	{
		image_blend = c_red;
		
		// Execute
		if (!do_load_level)
		{
			button_function();
		}
		else
		{
			room_goto(level_to_load);
		}
	}
}
else
{
	image_blend = color;
}

if (instance_exists(obj_camera))
{
	var _camera = obj_camera;
	x = xstart * _camera.scale_window;
	y = ystart * _camera.scale_window;
}