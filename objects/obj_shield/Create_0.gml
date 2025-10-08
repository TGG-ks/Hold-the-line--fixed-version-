/// @description Insert description here
// You can write your code in this editor

//disable natural rotation
phy_fixed_rotation = true;

snap_to_me = function(_x, _y){
	
	//attack
	var _attack = mouse_check_button(global.activate_shield);
	
	//point from the player's position to the mouse
	var _dir = point_direction(_x,_y,mouse_x,mouse_y);
	var _hover_dist = 55;
	
	//how far away you should hover
	var _x_additive = lengthdir_x(_hover_dist,_dir);
	var _y_additive = lengthdir_y(_hover_dist,_dir);
	
	//set my position to my hover location
	phy_position_x = _x + _x_additive;
	phy_position_y = _y + _y_additive;
	
	//shove the shield
	if(_attack){
		//"throw" the shield forward
		if(!instance_exists(obj_shield_shove)){
			var _ss = instance_create_layer(
			phy_position_x+lengthdir_x(10,_dir),
			phy_position_y+lengthdir_y(10,_dir),
			layer,obj_shield_shove);
			
			var _amplify_amount = 1000;
			_ss.throw_shield(_x_additive*_amplify_amount, _y_additive*_amplify_amount);
			_ss.phy_rotation = -_dir;
		}
	}
	
	_dir = point_direction(_x,_y,mouse_x,mouse_y);
	//orient to the mouse
	phy_rotation = -_dir;
}
