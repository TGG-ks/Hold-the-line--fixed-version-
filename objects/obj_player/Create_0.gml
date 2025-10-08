/// @description Insert description here
// You can write your code in this editor

spd = 5;

my_head = instance_create_layer(x,y,layer,obj_head);
my_head.owner = id;

//make my shield
my_shield = instance_create_layer(x,y,layer,obj_shield);
my_spear = instance_create_layer(x,y,layer,obj_spear);

#region make my fixture
fix = physics_fixture_create();

physics_fixture_set_polygon_shape(fix);

// Basic 60x60 square
var _half_spr_width = sprite_width/2;
var _half_spr_height = sprite_height/2;

var _top_sprite_offset = 12;
var _bottom_sprite_offset = 17;

physics_fixture_add_point(fix, -_half_spr_width + _top_sprite_offset, -_half_spr_height); //top left corner
physics_fixture_add_point(fix, _half_spr_width - _top_sprite_offset, -_half_spr_height); //top right corner
physics_fixture_add_point(fix, _half_spr_width, _half_spr_height-20); //middle right
physics_fixture_add_point(fix, _half_spr_width - _bottom_sprite_offset, _half_spr_height); //bottom left
physics_fixture_add_point(fix, -_half_spr_width + _bottom_sprite_offset, _half_spr_height); //bottom right
physics_fixture_add_point(fix, -_half_spr_width, _half_spr_height-20); //middle left

physics_fixture_set_collision_group(fix, 0);
physics_fixture_set_density(fix, 1);

physics_fixture_bind(fix, id);
#endregion

//this disables the player's ability to rotate naturally through the physics system
phy_fixed_rotation = true;

event_inherited();
