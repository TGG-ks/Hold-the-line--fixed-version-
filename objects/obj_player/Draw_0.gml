draw_sprite_ext(
sprite_index,
image_index,
x,
y,
dir,
image_yscale,
image_angle,
image_blend,
image_alpha
);

switch(state){
		
	case states.IDLE:
		#region
		
		#endregion
	break;
	
	case states.RUNNING:
		#region
		
		#endregion
	break;
	
	case states.STUNNED:
		#region
		var _x_additive = -lengthdir_y(sprite_width,-image_angle);
		var _y_additive = -lengthdir_x(sprite_height-30,-image_angle);
		draw_sprite(spr_stunned_animation,current_time/100,x+_x_additive,y+_y_additive);
		#endregion
	break;
	
	case states.DEAD:
		#region
		
		#endregion
	break;
}


var _debug = false;

if(_debug){
	var _string = "";
	
	switch(state){
		
		case states.IDLE:
			#region
			_string = "Idle";
			#endregion
		break;
		
		case states.RUNNING:
			#region
			_string = "Running";
			#endregion
		break;
		
		case states.STUNNED:
			#region
			_string = "Stunned";
			#endregion
		break;
		
		case states.DEAD:
			#region
			_string = "Dead";
			#endregion
		break;
	}
	
	draw_text(x,y,_string);
	physics_draw_debug();
}
