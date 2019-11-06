var halfw = w * 0.5;

//Draw the Box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x-halfw-border, y-h-(border*2), x+halfw+border, y,15,15,false);

draw_sprite(spr_Marker,0,x,y);
draw_set_alpha(1);

//Draw Text
DrawSetText(c_white,f_Sign,fa_center,fa_top);
draw_text(x,y-h-border,text_current);

/*
-First we want half of the width of the total amount of text (I think).

-We set the color to black, make it a bit transparent by setting its
alpha to 0.5, and draw a round rectangle.

-The draw_rect function asks for 4 coordinate, one for each corner of 
the rect we wanna draw. We want a bit of extra space above, below, and
the sides of the text, which is why we're adding and subtracting things
like 'halfw' for half the text width, 'border' for an extra 10px margin,
etc. The 15,15 is asking for a radius of what I assume is for the rounded
edges of the rectangle. False because it's asking if we want an 
outlined rectangle. We want a filled rect so we set it to false. 

-Draw the sprite (the marker) at it's origin, which is 1px above the center.
Then reset the alpha to 1, otherwise GM will keep changing the alpha.
*/