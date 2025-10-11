/// @description Insert description here
// You can write your code in this editor

if(instance_exists(owner)){
	
	var _dir = -owner.phy_rotation + 90;
	
	var _dist = 15;
	
	var _x_additive = lengthdir_x(_dist,_dir)
	var _y_additive = lengthdir_y(_dist,_dir);
	
	x = owner.x + _x_additive;
	y = owner.y + _y_additive;
	
	if(place_meeting(x,y,obj_floor)||place_meeting(x,y,obj_boulder)){
		owner.state = states.DEAD;
	}
}else{
	instance_destroy();
}
