/// @description Progress the Transition

/*
-First we wanna check to make sure our current transition is not OFF. We then check to
see if we're in the INTRO mode, or when the bars opening up. 

-Now here is some clever math: The first max() compares which is larger, the 0 or 
the percent. But percent is constantly changing as it subtracts the max() of a tenth 
of it's current value. So if it's 1, then it'll subtract 0.1 the first time around, 
which is a fairly big chunk. On the next run, it'll take one tenth of 0.9 away, 
and so on. So it'll start quickly but slow down over time. Eventually, it'll become 
smaller than 0.005; that's why we have that there so it doesn't get unbearably 
small and slow.

-The second clever math is basically showing us how much 'distance' we have left to go
before we're done at 0. We're starting at 1 then continuing until the distance is 
totally covered. Kinda confusing still, refer to about 17 minutes into the Part 7
tutorial video for clarification if needed.
*/

if (mode != TRANS_MODE.OFF) 
{
	if(mode == TRANS_MODE.INTRO) 
	{
		percent = max(0,percent - max((percent/10),0.005));
	}
	else 
	{
		percent = min(1.1,percent + max(((1.1 - percent)/10),0.005));
	}
	
	if(percent == 1.1) || (percent == 0)
	{	
		switch (mode){
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
		}
	}
}

/*
-The switch statement. We'll be able to jump between our established mode, transitions,
and rooms from here depending on the situation; namely when percent = 1 or 0, aka
when the black bars are fully closed or open.
-If mode is set to the INTRO, then we'll set it to OFF as it then means we're done
transitioning and there's no need for the bars anymore.
-If mode is set to NEXT, then we're transitioning from one room into the next. We set
mode to INTRO because we want the black bars to do their thing here as we're
transitioning. Additionally, room_goto_next() is a built-in GM function that does
what you think; it goes from the current room we're in to the next sequential room.
In our case, we're going from room1 to room2.
-If mode is set to GOTO, then play the INTRO again so we see the black bars animate
once more. room_goto(room) is basically the same as the function within the NEXT
case, only we can specify what room to jump to. That's where 'target' comes in, which
will actually allow us to go from room2 to room1 or any room no problem.
-If mode is set to RESTART, then just restart the game.
*/