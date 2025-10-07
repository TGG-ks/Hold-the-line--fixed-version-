/// @description Insert description here
// You can write your code in this editor

//movement stuff
var _left = keyboard_check(vk_left)||keyboard_check(ord("A"));
var _right = keyboard_check(vk_right)||keyboard_check(ord("D"));
var _move_h = _right - _left;
_move_h *= spd;

if(_move_h != 0){
	//move about
	physics_apply_force(x, y, _move_h*1000, 0);
}

var max_x_speed = 10;

//dont allow speed to become too great
phy_speed_x = clamp(phy_speed_x, -max_x_speed, max_x_speed);

//hold the shield
my_shield.snap_to_me(phy_position_x, phy_position_y);

var _on_ground = place_meeting(phy_position_x, phy_position_y+1, obj_floor);
show_debug_message(_on_ground);


