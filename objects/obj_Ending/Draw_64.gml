/// @description 

draw_set_color(c_black);
draw_rectangle(0,0,RES_W,128,false);
draw_rectangle(0,RES_H-128,RES_W,RES_H,false);

DrawSetText(c_black,f_Sign,fa_center,fa_top);
draw_text(RES_W*0.5 + 2,RES_H*0.3 + 2,text);
draw_set_color(c_white);
draw_text(RES_W*0.5,RES_H*0.3,text);

/*
-Draw some black rectangles on the top and bottom of the screen. They both cover the
width of the screen, and go down 128 from the top, and 128 (RES_W-128) from the bottom.

-Use DrawSetText() to set the color, font, x-alignment, and y-alignment.

-First draw_text() sets the black outline we love so much. Draw it halfway in the x
direction with an offset of 2px, draw 30% down from the top in the y direction with an
offset of 2px, and specify the text we wanna draw.

-Set the color to white, and redraw the text but without the offsets so we can draw
our actual white text that we wanna display.
*/