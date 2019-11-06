/// @description Draw Menu

/*
-draw_set_font sets the font we wanna use for our GUI text.

-draw_set_halign sets our horizontal paragraph alignment. Like centered, left or
right justified, etc. We set it to the right

-draw_set_valign sets our vertical alignment. We're drawing from the 
bottom-right, upwards if that makes sense.

-The 'for' loop checks if 'i' is less than menu_items, aka 3. We'll
stay in this loop as long as that's true.

-offset is just an offset of 2px. It's used later to help create a 
little fake outline around out text so it looks nicer. It does this by
just drawing the text multiple times in black before finally drawing
the actual text we want in white with some black around it.

-txt is the actual text we wanna display. We're accessing the array of
menu[] because that's where all our text strings are stored. Using
index i will help us access and determine which string is needed at 
the moment during selection.

-Our 'if' statement checks if we're hovering over a particular item.
When we are, insert a ">" so it looks like we have an arrow before
that item in the menu. Then set the color to white. The 'else' 
statement is for the items that aren't hovered over, in which case
they'll have the gray color.

-var xx is where we wanna draw the menu. It's set to our menu_x which
is at the edge of the screen on the right.

-var yy works similarly only we used a small formula to help space out
the item text a bit. We did so by subtracting the height of the text
times 1.5 (a space of about half of a text height's).

-draw_set_color(c_black) and the 4 draw_text(xx-offset,yy,txt) 
statements are used to draw the outline around the text. Again, we're
manipulating the coordinates by adding or subtracting the offset
from the x or y coordinate.

-Finally, reset the color to white, then draw the text based on the
xx,yy coordinates, and txt, which is determined by the menu[] array.
*/

draw_set_font(f_Menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i) 
	{
		txt = string_insert("> ", txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;
	}

	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 1.5));
	draw_set_color(c_black);
	draw_text(xx-offset,yy,txt);
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy+offset,txt);
	draw_text(xx,yy-offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
}

draw_set_color(c_black);
draw_rectangle(gui_width,gui_height-200,gui_width+900,gui_height,false);