/// @description Insert description here
// You can write your code in this editor
alarm[0] = 10;

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
physics_fixture_set_density(fix, 4);
physics_fixture_bind(fix, id);
#endregion

//this disables the ability to rotate naturally through the physics system
phy_fixed_rotation = true;

throw_shield = function(_x_force, _y_force){
	physics_apply_force(phy_position_x, phy_position_y, _x_force, _y_force);
}

