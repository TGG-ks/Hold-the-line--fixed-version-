
draw_self();

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

