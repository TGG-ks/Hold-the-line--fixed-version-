/// @description Insert description here
// You can write your code in this editor

my_head = instance_create_layer(x,y,layer,obj_head);
my_head.owner = id;

my_shield = instance_create_layer(x,y,layer,obj_shield_enemy);
my_axe = instance_create_layer(x,y,layer,obj_axe);
my_axe.owner = id;

spd = 5;

dir = 0;

stunned_recovery = 0;

debug = false;

state = states.IDLE;

#region make my fixture
fix = physics_fixture_create();

physics_fixture_set_polygon_shape(fix);


var _half_spr_width = sprite_get_width(spr_player)/2;
var _half_spr_height = sprite_get_height(spr_player)/2;

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

physics_fixture_set_collision_group(fix, 1);
physics_fixture_set_density(fix, 1);

physics_fixture_bind(fix, id);
#endregion

event_inherited();


