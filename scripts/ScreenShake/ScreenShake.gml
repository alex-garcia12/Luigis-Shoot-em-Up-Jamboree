/// @description ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (radius in pixels)
/// @arg Frames sets the length of the shake in frames (60 = 1 second at 60 fps)

/*
-The first if statement checks if the incoming shake that was just
called is bigger than the current shake (so like an explosion vs the
gun firing) the bigger shake will override the smaller shake. That
way bigger shakes are emphasized over smaller shakes. If true, then
reset the magnitude, shake_remain, and adjust the shake's duration.
*/

with(obj_Camera)
{
	if(argument0 > shake_remain)
	{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
}