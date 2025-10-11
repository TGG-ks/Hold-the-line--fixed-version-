//make an attack
if(place_meeting(x,y,obj_player)){
	with(obj_player){
		hp --;
		stunned_recovery = 0;
		
		var _push_dir_h =  2500;
		var _push_dir_v = 35; //should "hit" the enemy either in the top or bottom half
		
		physics_apply_force(x, y+_push_dir_v, _push_dir_h, 0);
	}
}




