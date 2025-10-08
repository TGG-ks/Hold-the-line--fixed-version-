

switch(state){
	
	case states.IDLE:
		#region
		phy_fixed_rotation = true;
		state = states.RUNNING;
		#endregion
	break;
	
	case states.RUNNING:
		#region
		phy_fixed_rotation = true;
		
		var _move_h = sign(obj_player.phy_position_x-phy_position_x);
		_move_h *= spd;
		
		if(_move_h != 0){
			//move about
			physics_apply_force(x, y, _move_h*1000, 0);
		}
		
		var max_x_speed = 10;
		
		//dont allow speed to become too great
		phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);
		#endregion
	break;
	
	case states.STUNNED:
		#region
		phy_fixed_rotation = false;
		#endregion
	break;
	
	case states.DEAD:
		#region
		phy_fixed_rotation = false;
		instance_destroy();
		#endregion
	break;
}


