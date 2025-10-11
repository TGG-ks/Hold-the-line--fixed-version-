/// @description Insert description here
// You can write your code in this editor

if(room == rm_level_select){
	for(var i = 0; i < array_length(levels); i++){
		
		draw_set_font(F1);
		draw_set_halign(fa_left);
		var _str = levels[i].name;
		var _xx = room_width/2;
		var _yy = 30 + (i * 45);
		
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		var _width = (string_width(_str)/2)+10;
		var _height = 40;
		draw_rectangle(_xx-_width,_yy,_xx+_width,_yy+_height,false);
		
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_text(_xx-_width+5,_yy,_str);
		
	}
}


