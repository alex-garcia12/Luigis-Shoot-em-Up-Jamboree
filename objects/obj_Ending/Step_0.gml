/// @description Move Player Towards Center

layer_x("TitleAssets", min(layer_get_x("TitleAssets")+1, RES_W * 0.5 - 32));

/*
-We're actually going to move the entire TitleAssets layer rather than the player and
gun sprites individually.

-We set the x coordinate of the TitleAssets layer, and we move it by the min() between
the current x coordinate of TitleAssets + 1, and half of the resolution (RES_W * 0.5).
So we keep scrolling the x coordinate of the layer until we reach half of the screen's
resolution. 

-We have the -32 there because of some weird buffer issue that has to do 
with the camera or something. Refer to about 20:10 or so in Part 25 to go over his 
explanation again.
*/

//====================================================================================
//Progress Text

letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

/*
-The number of letters we currently have displayed is letters += spd. I think at the
current rate we have (spd = 0.5) that means one letter per 2 frames.

-Set 'text' to a copy (string_copy()) of the current text that's being displayed
(endtext[currentline]), start at the first character, and the last parameter is 
asking how many characters in the string we wanna copy. In this case, we wanna go
until we're out of characters, so we go until we reach 'letters'. The reason why
'letters' is inside floor() is because floor() takes the argument's value and rounds
it down. We need this because 'letters' is being incremented by 0.5 so if there's a 
string that results in 'string' ending up with a 0.5 at the end, it'll round back
down and 'text' won't have to deal with that decimal problem.
*/

//====================================================================================
//Next Line

if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	if (currentline + 1 == array_length_1d(endtext))
		{
			SlideTransition(TRANS_MODE.RESTART);
		}
	else
	{
		currentline++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}

/*
-Check if 'letters' is >= the length of the current endtext[] string. If that's the
case, AND we've pressed any key, then progress to the next line to write.

-The first 'if' checks if we're on the last endtext[]. array_length_1d() simply
returns the value of the length of the array within its parameters. If this is true,
then restart the game.

-If we haven't reached the end of the length of the array, then increment currentline
to be the next element (line of dialogue) to display, reset 'letters' to be 0 so we
can start recalculating the number of letters from the beginning, and reset 'length'
to be the length of the string of the (next) line in endtext[] based on the currentline.
*/