

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
		
		if(_move_h != 0 && _on_ground){
			//move about
			physics_apply_force(x, y, _move_h*1000, 0);
		}
		
		var max_x_speed = 10;
		
		//reset stunned state
		stunned_recovery = 0;
		
		//dont allow speed to become too great
		phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);
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
}


