/// @description Insert description here
// You can write your code in this editor

//movement stuff
var _left = keyboard_check(vk_left)||keyboard_check(ord("A"));
var _right = keyboard_check(vk_right)||keyboard_check(ord("D"));
var _jump = keyboard_check_pressed(vk_space)||keyboard_check_pressed(ord("W"));
var _move_h = _right - _left;
_move_h *= spd;
var _move_v = 0;
var _jump_spd = -90000;

//you can't move if you're dead
if(state = states.DEAD){
	_left = false;
	_right = false;
	_jump = false;
}

//go to stunned state
if(hp <= 0){
	if(state != states.DEAD){
		state = states.STUNNED;
	}
}

if(_move_h != 0){
	dir = sign(_move_h);
}

var _on_ground = place_meeting(phy_position_x, phy_position_y+1, obj_floor);

switch(state){
	
	case states.IDLE:
		#region
		phy_fixed_rotation = true;
		phy_rotation = 0;
		//jump
		if(_jump && _on_ground){
			_move_v = _jump_spd;
			
		}
		
		physics_apply_force(x, y, _move_h*1000, _move_v);
		
		#endregion
	break;
	
	case states.STUNNED:
		#region
		
		
		if(firt_time_going_to_stunned_state){
			
			firt_time_going_to_stunned_state = false;
		}
		
		phy_fixed_rotation = false;
		
		//try to stand back up
		var _targetDir = 0;
		var _angleDiff = angle_difference(_targetDir, phy_rotation);
		
		var stun_timer_max = 30;
		
		stunned_recovery = clamp(stunned_recovery+1,0,stun_timer_max);
		
		phy_angular_velocity = sign(_move_h) * stunned_recovery;
		
		//leave the state
		if(abs(angle_difference(0, phy_rotation)) < 5){
			if(stunned_recovery == stun_timer_max && _on_ground){
				state = states.IDLE;
				stunned_recovery = 0;
				hp = 3;
				firt_time_going_to_stunned_state = true;
				phy_rotation = 0;
			}
		}
		
		//jump
		if(_jump && _on_ground){
			_move_v = _jump_spd;
		}
		
		physics_apply_force(x, y, _move_h*1000, _move_v);
		
		#endregion
	break;
	
	case states.DEAD:
	
	phy_speed_x = 0;
	phy_speed_y = 0;
	phy_fixed_rotation = true;
	
	if(alarm[0] == -1){
		alarm[0] = 60;
	}
	
	break;
}

var max_x_speed = 10;

//dont allow speed to become too great
phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);



