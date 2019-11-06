/// @description SlideTransition(mode,targetroom)
/// @arg Mode sets transition mode between NEXT, RESTART, and GOTO
/// @arg Target sets target room when using the goto mode

/*
-We're settomg 'mode' to the first argument that was passed into SlideTransition()
when it was called. That's what the [0] is for.
-Now we're checking if we have more than one argument. If we do, we'll set target
to that argument; specifically, we'll set it to the second argument, aka target.
*/

with (obj_Transition)
{
	mode = argument[0];
	//audio_play_sound(sn_Transition,10,false);
	if(argument_count > 1) {
		target = argument[1];
	}
}