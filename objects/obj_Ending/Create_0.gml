/// @description 

gunsprite = layer_sprite_get_id("TitleAssets","g_Gun");
if (global.hasgun) && (global.kills > 0)
{
	endtext[0] = "And on this day our hero had slain " + string(global.kills) + " people.";
	if(global.kills == 1) endtext[0] = "And on this day, our hero killed only one poor sap."
	endtext[1] = "But some of those people had guns too, so...";
	endtext[2] = "He was probably saving the world or something.";
	endtext[3] = "Regardless he was arrested two days later and spend the rest of his days in prison.";
	endtext[4] = "The defense team tried to argue that the sexy recoil effects and hit flashes were to blame,\nbut to no avail.";
	endtext[5] = "The park ranger would later state she was \"not angry, just disappointed.\"";
	endtext[6] = "The End";
}
else
{
	layer_sprite_destroy(gunsprite);
	endtext[0] = "On this day, our hero had a wonderful and serene walk through a national park\nand didn't even murder anyone.";
	endtext[1] = "They reported a discarded firearm to the local authorities\nand were thanked profusely in an ongoing criminal investigation.";
	endtext[2] = "And all it took was behavior that, outside a video game context,\none would hope it completely normal";
	endtext[3] = "Who would've thought?";
	endtext[4] = "The End";
}

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";

/*
-We start by acquiring the gun sprite graphic we set in the r_Ending. We do this by
setting gunsprite to the function layer_sprite_get_id() which asks for the layer we
wanna get the sprite from and what sprite/graphic we want exactly.

-We have multiple endings. The first if checks if we picked up the gun and killed at
least one guy. If so, this is the text for the 'dark' ending. 

-Could later add a check to see if the player took the gun but didn't kill anyone.

-If we never took the gun, then destroy the gunsprite in the ending.

-spd determines the rate at which the letters are being drawn.
-letters determines how many letters we're currently showing of the string.
-currentline determines which endtext[] array we're on.

-length determines the length of the string of each particular endtext. We can do this
by setting the value inside the [] of endtext[] with currentline.

-text shows the text being currently showed to the screen. It'll slowly build up
as we write text to the screen then get wiped every time we start drawing a brand
new string to the screen.
*/

/*
-Side note: this isn't too big a problem, but may wanna consider doing text stuff
from files like .txt or .ini files. 
*/