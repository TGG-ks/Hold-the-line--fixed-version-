/// @description Insert description here
// You can write your code in this editor

owner = noone;

attack_timer = 75;
attack_timer_max = attack_timer;

snap_to_me = function(_x, _y,dir){
	x = _x;
	y = _y;
	
	image_xscale = dir;
	
	var _percentage_through = ((attack_timer/attack_timer_max) * dir);
	image_angle = (90*image_xscale) - (_percentage_through * 180);
	
	if(owner.state != states.STUNNED){
		//can't attack if stunned
		attack_timer --;
	}
	
	if(attack_timer <= 0){
		attack_timer = attack_timer_max;
		alarm[0] = 2;
	}
}


