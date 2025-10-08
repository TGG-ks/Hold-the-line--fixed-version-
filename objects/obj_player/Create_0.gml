/// @description Insert description here
// You can write your code in this editor

//this disables the player's ability to rotate naturally through the physics system
phy_fixed_rotation = true;

spd = 5;

my_head = instance_create_layer(x,y,layer,obj_head);
my_head.owner = id;

//make my shield
my_shield = instance_create_layer(x,y,layer,obj_shield);
my_spear = instance_create_layer(x,y,layer,obj_spear);

event_inherited();
