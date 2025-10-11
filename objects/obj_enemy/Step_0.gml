

switch(state){
	
	case states.IDLE:
		#region
		phy_fixed_rotation = true;
		state = states.RUNNING;
		#endregion
	break;
	
	case states.RUNNING:
		#region
		
		var _on_ground = place_meeting(phy_position_x, phy_position_y+1, obj_floor);
		
		phy_fixed_rotation = true;
		
		var _move_h = sign(obj_player.phy_position_x-phy_position_x);
		_move_h *= spd;
		
		if(_move_h != 0){
			dir = sign(_move_h);
		}
		
		if(_move_h != 0 && _on_ground){
			//move about
			physics_apply_force(x, y, _move_h*1000, 0);
		}
		
		//reset stunned state
		stunned_recovery = 0;
		#endregion
	break;
	
	case states.STUNNED:
		#region
		phy_fixed_rotation = false;
		
		//try to stand back up
		var _targetDir = 0;
		var _angleDiff = angle_difference(_targetDir, phy_rotation);
		
		var _on_ground = place_meeting(phy_position_x, phy_position_y+1, obj_floor);
		
		//recover from the stunned state
		stunned_recovery = clamp(stunned_recovery + 1, 0, 20);
		
		if(_on_ground){
			phy_angular_velocity = sign(_angleDiff) * stunned_recovery;
		}
		
		//leave the state
		if(abs(angle_difference(0, phy_rotation)) < 5){
			if(stunned_recovery == 20){
				state = states.IDLE;
				phy_rotation = 0;
			}
		}
		
		#endregion
	break;
	
	case states.DEAD:
		#region
		phy_fixed_rotation = false;
        
        var _s = id;
        with(obj_wave_controller)
        {
            current_wave_enemies[array_get_index(current_wave_enemies,_s)] = -1;
        }
        
		instance_destroy();
		#endregion
	break;
	
	case states.DEBUG:
		#region
		phy_speed_x = 0;
		phy_speed_y = 0;
		debug = true;
		phy_fixed_rotation = true;
		#endregion
	break;
}

var max_x_speed = 5;

//dont allow speed to become too great
phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);

if(instance_exists(my_shield)){
	my_shield.snap_to_me(phy_position_x, phy_position_y, dir);
}
if(instance_exists(my_axe)){
	my_axe.snap_to_me(phy_position_x, phy_position_y, dir);
	my_axe.depth = depth-1;
}
