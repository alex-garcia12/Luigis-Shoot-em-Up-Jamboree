/// @description 

if (sprite_exists(pause_sprite) && paused)
{
	draw_sprite_ext(pause_sprite, 0, 0, 0, 1, 1, 0, c_white, 1);
}

//if (instance_exists(follow))
//	xTo = follow.x;
//	yTo = follow.y;