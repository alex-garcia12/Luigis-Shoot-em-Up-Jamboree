/// @description Size variables and mode setup

/*
-The function display_get_gui_width() does what you think it does; it gets the width
of the GUI. The GUI isn't dependent on the camera or anything. It's basically the 
width of the actual game window. Same goes for the height. 
-We half h_half because the way we want the screen to transition is by having black 
rectangles 'grow' starting from the top and bottom of the screen and meeting at the
middle of the screen, aka half of the screen height.

-We're using enum to establish different states or mode the transition is currently in.
These values never change so they'll be useful in determining the current transition.
We're initializing the first mode to intro.

-percent represents the 'amount' of screen that is covered in black. It'll be between
0 and 1, with 1 meaning the screen is totally black.
-target represents the room we wanna transition to. It's gonna work with GOTO, as in
we'll give GOTO the value of 'target' which will tell it which room we wanna go into.
*/

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.INTRO;
percent = 1.2;
target = room;

