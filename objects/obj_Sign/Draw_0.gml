/// @description 
draw_self();
if (nearby) 
	draw_sprite_ext(spr_W, 0, x, y-32 , 1, 1, 0, c_white, 1);
//while (nearby) 
//{
//draw_sprite_ext(spr_W.image_index = 0, 0, x, y-32 , 1, -1, 0, c_white, 1);
//}


/*
-First we say draw_self() because having a Draw event overrides the default draw_self() so we
need this to actually draw the Sign.

-Check if 'nearby' is true. If so, use draw_sprite_ext() to draw a certain sprite (spr_Marker)
starting at a certain frame (0, the first frame of the sprite's 'animation') at a certain 
x,y position (the sign's position but -32px above the sign) at a certain xy scale (1, which is 
no scale change for x but -1 for y to flip the image upside down) at a certain rotation (0 for 
no rotation) with a certain color (choosing a color here actually blends the color you specify
here with the color already given to the sprite. If you typically don't want the color of the 
sprite to change, just pick c_white) with a certain alpha (1 for the most opaque).
*/