/// @description Die

with (obj_Gun) instance_destroy();

instance_change(obj_PlayerDead,true);

//direction = point_direction(other.x,other.y,x,y);
//hsp = lengthdir_x(6,direction);
//vsp = lengthdir_y(4,direction)-2;

//if (sign(hsp) != 0) image_xscale = sign(hsp);

global.kills -= global.killsthisroom;
global.myscore -= global.scorethisroom;
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

-After we die, reduce the player's kill count by the number of kills
they got in that room. That way when we die, the counter will properly
go back down.
*/