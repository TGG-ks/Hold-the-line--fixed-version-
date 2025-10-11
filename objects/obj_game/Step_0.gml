/// @description Insert description here
// You can write your code in this editor
if(room == rm_level_select){
	for(var i = 0; i < array_length(levels); i++){
		
		draw_set_font(F1);
		var _str = levels[i].name;
		var _room = levels[i].rm;
		var _xx = room_width/2;
		var _yy = 30 + (i * 45);
		
		var _width = (string_width(_str)/2)+10;
		var _height = 40;
		
		if(point_in_rectangle(mouse_x,mouse_y,_xx-_width,_yy,_xx+_width,_yy+_height)){
			//click on rooms
			if(mouse_check_button_pressed(mb_left)){
				room_goto(_room);
			}
		}
	}
}


