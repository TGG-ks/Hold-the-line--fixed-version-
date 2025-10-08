/// @description Insert description here
// You can write your code in this editor

#region make my fixture
fix = physics_fixture_create();

physics_fixture_set_polygon_shape(fix);

// Basic 60x60 square
var _half_spr_width = sprite_width/2;
var _half_spr_height = sprite_height/2;
physics_fixture_add_point(fix, -_half_spr_width, -_half_spr_height);
physics_fixture_add_point(fix, _half_spr_width, -_half_spr_height);
physics_fixture_add_point(fix, _half_spr_width, _half_spr_height);
physics_fixture_add_point(fix, -_half_spr_width, _half_spr_height);

physics_fixture_set_collision_group(fix, 1);
physics_fixture_set_density(fix, 2);
physics_fixture_bind(fix, id);
#endregion

//this disables the ability to rotate naturally through the physics system
phy_fixed_rotation = true;

snap_to_me = function(_x, _y){
	
	//attack
	var _attack = mouse_check_button(global.activate_shield);
	
	//point from the player's position to the mouse
	var _dir = point_direction(_x,_y,mouse_x,mouse_y);
	var _hover_dist = 45;
	
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
			phy_position_x+lengthdir_x(2,_dir),
			phy_position_y+lengthdir_y(2,_dir),
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
