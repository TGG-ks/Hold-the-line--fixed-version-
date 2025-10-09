/// @description Insert description here
// You can write your code in this editor

var _max_speed = 2;
if(abs(phy_speed_x) > _max_speed || abs(phy_speed_y) > _max_speed){
	if(place_meeting(x,y,obj_enemy_parent)){
		var _e = instance_place(x,y,obj_enemy_parent);
		
		with(_e){
			state = states.DEAD;
		}
	}
}


