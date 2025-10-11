#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height);


if(instance_exists(obj_player)){
		
	var _x = obj_player.x - view_width/2;
	var _y = y;//obj_player.y - view_height/1.5;
	
	x = lerp(x,_x,0.5);
	
	//clamp to room boundaries
	x = clamp(x,0, room_width+(view_width/2));
	_y = clamp(_y,0, room_height+(view_height/2));
	
	camera_set_view_pos(view,x,_y);
	
	if(layer_exists("Background")){
		var _lay_id = layer_get_id("Background");
		layer_x(_lay_id,x);
		layer_y(_lay_id,y);
	}
}else{

}

//debug
if(mouse_check_button_pressed(mb_left)){
	show_debug_message("you clicked at "+string(mouse_x)+","+string(mouse_y));
}
