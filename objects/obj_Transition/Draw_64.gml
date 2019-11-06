/// @description Draw Black Bars

/*
-Once again, check if our mode is actually OFF.
-Set the rectangle color to black using draw_set_color(c_black)
-Draw the rectangle. (0,0) sets the top-left coordinate of the rect, (w,percent) sets
the bottom-right coordinate of the rect. w = the actual window's width, and percent is
the y-coordinate that is contantly changing within the Step event. We multiply it by
h_half so we start at half of the screen's height. We set the last parameter to false
because it's asking if we want it outlined. We want it filled so it's set to false.

-Just a note, the first draw_rectangle() represents the top rectangle, the second 
draw_rectangle() represents the bottom rectangle.
*/

if(mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0,0,w,percent*h_half,false);
	draw_rectangle(0,h,w,h-(percent*h_half),false);
}