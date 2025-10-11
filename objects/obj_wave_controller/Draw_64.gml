draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(F1);


var _timer_in_seconds = floor(timer/60);
var _str = "Next wave in "+string(_timer_in_seconds)+" seconds...";
var _xx = display_get_gui_width()/2;
var _yy = 30;

draw_set_color(c_black);
draw_set_alpha(0.5);
var _width = (string_width(_str)/2)+10;
var _height = 20;
if (_timer_in_seconds > 0) draw_rectangle(_xx-_width,_yy-_height,_xx+_width,_yy+_height,false);

draw_set_color(c_white);
draw_set_alpha(1);
if (_timer_in_seconds > 0) draw_text(_xx,_yy,_str);
