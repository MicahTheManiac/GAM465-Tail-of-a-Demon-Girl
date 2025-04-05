// Base Width and Height
#macro BASE_WIDTH 640
#macro BASE_HEIGHT 360
#macro BASE_SCALE 3
#macro HTML:BASE_SCALE 2
#macro Embed:BASE_SCALE 1.75

// Camera Width and Height -- These variables are mainly used for Camera with Zoom
//	cam_width = BASE_WIDTH;
//	cam_height = BASE_HEIGHT;

// View Width and Height
view_width = BASE_WIDTH;
view_height = BASE_HEIGHT;

// Scaling -- Use scale_base if we need to separate scales for calculations
//	scale_base = BASE_SCALE
scale_window = BASE_SCALE;
if (display_get_width() <= 1920) scale_window = 2;

// Camera Target
target = obj_player;

// Initiate
alarm[0] = true;

function f_camera_fullscreen()
{
	// Check if we are Fullscreened
	switch(window_get_fullscreen())
	{
		// If we are Switching back from Fullscreen
		case true:
		window_set_fullscreen(false);
		
		// Reset Scale
		scale_window = BASE_SCALE;
		
		// Set Window
		alarm[0] = true;
		break;
		
		// If we are Entering Fullscreen
		case false:
		// Cache Width
		var _width_cache = global.window_width;
		
		// Get W+H
		var _width = display_get_width();
		var _height = display_get_height();
		
		// Set Scale Based on Height and Set Width based on Scale
		scale_window = (_height / BASE_HEIGHT);
		view_width = (_width / scale_window);
		
		// Fullscreen
		alarm[0] = true;
		window_set_fullscreen(true);
		
		// Set GUI -- With this System being Ported from Orbital Entropy Mobile, this may not be needed
		//	display_set_gui_size(global.window_width, global.window_height);
		break;
	}
}