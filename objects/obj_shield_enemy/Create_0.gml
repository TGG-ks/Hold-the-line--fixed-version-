/// @description Insert description here
// You can write your code in this editor
snap_to_me = function(_x, _y,dir){
	
	//point from the player's position to the mouse
	var _dir = point_direction(0,0,dir,0);
	var _hover_dist = 35;
	
	//how far away you should hover
	var _x_additive = lengthdir_x(_hover_dist,_dir);
	var _y_additive = lengthdir_y(_hover_dist,_dir);
	
	//set my position to my hover location
	x = _x + _x_additive;
	y = _y + _y_additive;
	
	//orient to the mouse
	image_angle = _dir;
}
