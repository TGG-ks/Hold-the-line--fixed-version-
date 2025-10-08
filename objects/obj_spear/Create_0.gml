/// @description Insert description here
// You can write your code in this editor

thrust_additive = 0;
thrust_timer = 0;

snap_to_me = function(_x, _y){
	
	//thrust with the spear
	if(thrust_timer > 0){
		thrust_additive = 30;
		
		if(place_meeting(x,y,obj_enemy_parent)){
			var _i = instance_place(x,y,obj_enemy_parent);
			
			with(_i){
				state = states.STUNNED;
				stunned_recovery = 0;
				var _push_dir_h = sign(x - _x) * 5000;
				var _push_dir_v = sign(mouse_y - y) * 12; //should "hit" the enemy either in the top or bottom half
				physics_apply_force(x, y+_push_dir_v, _push_dir_h, 0);
			}
		}
		
		thrust_timer -= 1;
	}else{
		thrust_additive = lerp(thrust_additive,0,0.2);
	}
	
	//attack
	var _attack = mouse_check_button(global.activate_spear);
	
	if(_attack){
		thrust_timer = 5;
	}
	
	//point from the player's position to the mouse
	var _dir = point_direction(_x,_y,mouse_x,mouse_y);
	var _hover_dist_x = 55 + thrust_additive;
	var _hover_dist_y = 35 + thrust_additive;
	
	//how far away you should hover
	var _x_additive = lengthdir_x(_hover_dist_x,_dir);
	var _y_additive = lengthdir_y(_hover_dist_y,_dir);
	
	//set my position to my hover location
	x = _x + _x_additive;
	y = _y + _y_additive;
	
	_dir = point_direction(_x,_y,mouse_x,mouse_y);
	//orient to the mouse
	image_angle = _dir;
}
