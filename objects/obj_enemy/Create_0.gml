/// @description Insert description here
// You can write your code in this editor

my_head = instance_create_layer(x,y,layer,obj_head);
my_head.owner = id;

spd = 5;


#region make my fixture
fix = physics_fixture_create();

physics_fixture_set_polygon_shape(fix);

// Basic square
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

physics_fixture_set_collision_group(fix, 1);
physics_fixture_set_density(fix, 1);
physics_fixture_bind(fix, id);
#endregion

event_inherited();


