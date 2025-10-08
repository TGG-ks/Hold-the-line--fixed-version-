draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_color(c_white);


var _timer_in_seconds = floor(timer/60);
if (_timer_in_seconds > 0) draw_text(room_width/2,30,"Next wave in "+string(_timer_in_seconds)+" seconds...")
