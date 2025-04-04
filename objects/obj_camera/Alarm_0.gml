///@desc Set Window Size & Center
// Get Window Width & Height
global.window_width = view_width * scale_window;
global.window_height = view_height * scale_window;

// Set Size and Resize Surface
window_set_size(global.window_width, global.window_height);
surface_resize(application_surface, global.window_width, global.window_height);

// Center Window
window_center();