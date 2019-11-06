/// @description 

if (keyboard_check(vk_control))
{
	window_set_fullscreen(!window_get_fullscreen());
}

/*
-We're setting the fullscreen toggle option to pressing Cntrl + F. If we press those together, then execute
the code inside.

-window_GET_fullscreen() checks to see if we're currently in fullscreen. We put an ! in front of it for a reason.
Say our game is currently NOT in fullscreen. If that's the case, then window_get_fullscreen() will be set to
false. Since we have the ! in front, that means it will be true. So now, when we press ctrl + F, then the 
function window_set_fullscreen() will have true inside, resulting in setting the screen to fullscreen.

-Currently as of the writing of this comment, as a general rule GUIs are drawn
onto the display of the game. Everything else is drawn onto what's called the
Application Surface. By default, the GUI and App Surface are aligned with each
other, but if we wanna do stuff like change to fullscreen, the GUI is still gonna
think the display is what it was before changing to fullscreen
*/