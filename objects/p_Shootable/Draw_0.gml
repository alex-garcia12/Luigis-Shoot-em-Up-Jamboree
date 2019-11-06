/// @description Insert description here

/*
-Draw events are used to manually change how an object is drawn. By default, if an object
does not have a draw event, GameMaker will automatically draw it for you based on things
you specified like x/y coordinates, position, size, etc. Essentially, it just runs the
draw_self() by defualt if not specified. But since we're using the Draw event, and we
still want our enemy drawn like normal, adding our own Draw event tells GameMaker not
to run draw_self() automatically. So we have to run draw_self() ourselves so GameMaker
knows to still draw our object (the enemy) like normal.

-shader_set(sh_White) sets the shader for this object to the specified shader.
-shader_reset() resets the shader currently applied to the current object to what it's
default is, or what it was before.

-flash helps define for how many frames we want the enemy to flash when hit. In the
collision event for obj_bullet with obj_enemy, flash gets set to 3 when a bullet hits
an enemy. Here in the draw event, when flash > 0 (in this case it would be 3) it will
run the if statement 3 times, aka 3 frames.
*/

draw_self();

if(flash > 0) {
	flash--;
	shader_set(sh_White)
	draw_self();
	shader_reset()
}