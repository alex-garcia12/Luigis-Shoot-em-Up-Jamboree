/// @description Draw Score

if (room != r_Menu) && (instance_exists(obj_Player)) && (global.myscore > 0)
{
	killtextscale = max(killtextscale * 0.95, 1);
	DrawSetText(c_black, f_Menu, fa_right, fa_top);
	draw_text_transformed(RES_W-8, 12, "Score: " + string(global.myscore), killtextscale, killtextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(RES_W-10, 10, "Score: " + string(global.myscore), killtextscale, killtextscale,0);
}


/*
-First off, don't draw the score until we have at least one kill.

-Set killtextscale to the max() of killtextscale (which is set to 2 whenever an
enemy is killed) * 0.95 (so the size continuously get smaller) or 1. In which case
the size of the text will even out to 1 once that effect is over.

-We use DrawSetText() (a script we wrote before) to set the color (black), the font,
(f_Menu), the horizontal alignment (fa_right) and the vertical alignment (fa_top).

-NOTE: The first draw_text_transformed() is being used to establish the little
shadow outline thing we love so much
We use draw_text_transformed() to set the x position of the text (RES_W being
the resolution aka 1024 but we have -8 so it's 8px from the right), the y
position of the text (just 12 aka 12px from the top), the string of text we 
wanna display (use string() to display our current number of kills and + "text"
to add more text after the kill counter), the xscale and yscale (killtextscale for
both x,y) and the angle which is set to zero because we don't want an angle.

-This draw_text_transformed() (the second one) is used to align the actual
text that we wanna display.
*/