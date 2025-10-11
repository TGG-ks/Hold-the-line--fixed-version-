/// @description Insert description here
// You can write your code in this editor

spd = 5;
dir = 1;

my_head = instance_create_layer(x,y,layer,obj_player_head);
my_head.owner = id;

hp = 3;
firt_time_going_to_stunned_state = true;

stunned_recovery = 0;

//make my shield
my_shield = instance_create_layer(x,y,layer,obj_shield);
my_spear = instance_create_layer(x,y,layer,obj_spear);

#region make my fixture
fix = physics_fixture_create();

physics_fixture_set_polygon_shape(fix);


var _half_spr_width = sprite_width/2;
var _half_spr_height = sprite_height/2;

var _head_size = 30;

var _top_sprite_offset = 5;
var _bottom_sprite_offset = 17;

physics_fixture_add_point(fix, -_half_spr_width + _top_sprite_offset, -_half_spr_height+_head_size); //top left corner
physics_fixture_add_point(fix, _half_spr_width - _top_sprite_offset, -_half_spr_height+_head_size); //top right corner
physics_fixture_add_point(fix, _half_spr_width-4, _half_spr_height-10); //middle right
physics_fixture_add_point(fix, _half_spr_width - 5, _half_spr_height-5); //middle right
physics_fixture_add_point(fix, _half_spr_width - _bottom_sprite_offset, _half_spr_height); //bottom left
physics_fixture_add_point(fix, -_half_spr_width + _bottom_sprite_offset, _half_spr_height); //bottom right
physics_fixture_add_point(fix, -_half_spr_width + 5, _half_spr_height-5); //middle left
physics_fixture_add_point(fix, -_half_spr_width+4, _half_spr_height-10); //middle left

physics_fixture_set_collision_group(fix, 0);
physics_fixture_set_density(fix, 6);

physics_fixture_bind(fix, id);
#endregion

//this disables the player's ability to rotate naturally through the physics system
phy_fixed_rotation = true;

event_inherited();
