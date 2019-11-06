/// @description Progress Text

letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(f_Sign);
if (h == 0) h = string_height(text);
w = string_width(text_current);

//Destroy When Done
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	instance_destroy();
	with(obj_Camera) follow = obj_Player;
}


/*
-We wanna add spd to letters every frame so we can determine the number
of characters we're adding/writing/drawing per frame.

-We then set text_current to constantly update and copy the string 
within text. We wanna start at the first letter so we select 1 for
the index (second argument), and choose letters for the last argument
because the last argument is asking for the amount we wanna copy, in
this case letters is gonna determine that for us. Also the floor()
function just returns a value rounded down to the nearest integer.
This is just so we don't have any rounding or adding problems since
we're adding 0.25 every frame.

-We set draw_set_font() here because we need the height and width in
pixels. This will help determine how big the text box needs to be.
Different fonts have different sizes so be sure to set that before 
messing with string functions that change the look aside from the text.

-The 'if' statement checks if the height of the text is 0, which is
what we initialized it to. If true, then set h to the height of the
text; specifically, the height of the font we chose.

-w holds the width of our string and will help determine the size of 
the text box as well. The text box size will increase as the text
is being written/drawn.

-The next 'if' statement checks if we ran out of characters to write.
If so, and the player started pressing buttons again, destroy the 
text instance, and re-adjust the camera to focus on the player.
*/