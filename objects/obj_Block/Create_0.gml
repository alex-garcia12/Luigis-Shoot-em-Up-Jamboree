/// @description Create Wall

mywall = instance_create_layer(x,y,layer,obj_Wall);
//myspecialwall = instance_create_layer(x,y,layer,obj_SpecialWall);
hsp = 0;
vsp =1;
grv = 0.1;

with (mywall)
{
	image_xscale = other.sprite_width / sprite_width;
	image_yscale = other.sprite_height / sprite_height;
}


/*
-Initialize mywall to create an instance on the current layer, or the
wall layer. Position it where we placed it in the room editor, and
make it a wall object.

-We scale the x and y of the crate to match the size of the wall. Both
the wall and the crate are the same size so this shouldn't be a problem.
*/