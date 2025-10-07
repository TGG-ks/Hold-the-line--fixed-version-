/// @description Insert description here
// You can write your code in this editor
alarm[0] = 5;

//disable natural rotation
phy_fixed_rotation = true;

throw_shield = function(_x_force, _y_force){
	physics_apply_force(phy_position_x, phy_position_y, _x_force, _y_force);
}

