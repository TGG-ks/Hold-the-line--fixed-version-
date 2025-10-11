/// @description Insert description here
// You can write your code in this editor

draw_set_font(F2);
draw_set_halign(fa_left);
var _str = tips[tip_index];
var _xx = x;
var _yy = y;

draw_set_color(c_black);
draw_set_alpha(0.5);
var _width = (string_width(_str)/2)+10;
var _height = string_height(_str);
draw_rectangle(_xx-_width,_yy-20,_xx+_width,_yy+_height,false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_text(_xx-_width+5,_yy,_str);


