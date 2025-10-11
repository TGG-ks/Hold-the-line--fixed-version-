var division = 1;
view_width = room_width/division;
view_height = room_height/division;

windowScale = 2;

window_set_size(view_width*windowScale, view_height*windowScale);
alarm[0] = 1;

//resize app surface
surface_resize(application_surface, view_width*windowScale, view_height*windowScale);


