/// @description Insert description here
// You can write your code in this editor

thrust_additive = 0;
thrust_timer = 0;

attack_cooldown = 25;
attack_cooldown_max = attack_cooldown;

attacked_this_turn = false;

snap_to_me = function(_x, _y){
	
	//thrust with the spear
	if(thrust_timer > 0){
		thrust_additive = 30;
		
		if(attacked_this_turn == false){
			if(place_meeting(x,y,obj_enemy_parent)){
				var _i = instance_place(x,y,obj_enemy_parent);
				
				if(!place_meeting(x,y,obj_shield_enemy)){
					var _push_dir_h = sign(x - _x) * 3000;
					var _push_dir_v = sign(mouse_y - y) * 35; //should "hit" the enemy either in the top or bottom half
					var _toss_v = -800;
					
					with(_i){
						if(state != states.STUNNED){
							state = states.STUNNED;
							stunned_recovery = 0;
						
							physics_apply_force(x, y+_push_dir_v, _push_dir_h, _toss_v);
						}else{
							physics_apply_force(x, y+_push_dir_v*3, _push_dir_h, _toss_v);
						}
					}
				}else{
					//destroy the shield
					var _s = instance_place(x,y,obj_shield_enemy);
					
					with(_s){
						instance_destroy();
					}
				}
			}
			
			//attack once
			attacked_this_turn = true;
		}
		
		thrust_timer -= 1;
	}else{
		thrust_additive = lerp(thrust_additive,0,0.2);
	}
	
	//attack
	var _attack = mouse_check_button(global.activate_spear);
	
	attack_cooldown --;
	
	if(_attack){
		if(attack_cooldown <= 0){
			thrust_timer = 5;
			attack_cooldown = attack_cooldown_max;
			attacked_this_turn = false;
		}
	}
	
	//point from the player's position to the mouse
	var _dir = point_direction(_x,_y,mouse_x,mouse_y);
	var _hover_dist_x = 25 + thrust_additive;
	var _hover_dist_y = 10 + thrust_additive;
	
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
