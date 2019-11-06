/// @description Die

with (obj_Gun2) instance_destroy();

instance_change(obj_Player2Dead,true);

direction = point_direction(other.x,other.y,x,y);
hsp = lengthdir_x(6,direction);
vsp = lengthdir_y(4,direction)-2;

if (sign(hsp) != 0) image_xscale = sign(hsp);

/*
-When we collide with an enemy, we want the player to die. But we also
wanna destroy the gun so we don't have it still following the mouse,
the player, etc. So we just destroy it.

-We use instance_change() to turn our current player instance from
obj_Player to obj_PlayerDead. First argument the function takes is
what we want current object to change into, and the second argument
asks if we wanna execute the events within that object. We do want
it to execute those events since they contain the sprites, the 
animations, slow mo, etc.
*/