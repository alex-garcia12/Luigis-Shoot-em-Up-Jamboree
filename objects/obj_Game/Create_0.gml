/// @description 

#macro RES_W 1024
#macro RES_H 768
display_set_gui_size(RES_W,RES_H);

global.hasgun = false;
global.kills = 0;
global.killsthisroom = 0;
killtextscale = 1;

global.myscore = 0;
global.scorethisroom = 0;

/*
-macros are essentially constants to a degree. According to the tutorial, they
are executed at run-time. Wherever we write one like RES_W or RES_H anywhere in
any object throughout the project (macros are global in scope), the name of the
macro will be replaced by the value it is given. 

-We're setting the GUI size to 1024 x 768 so the GUI stays consistent throughout
the project; whether we set the game to fullscreen or not. 

-We're making these variables global so we can access them anywhere in the 
project. 

-hasgun checks if the player has a gun

-kills is gonna track our total score

-killsthisroom is goint to act as a counter for the number of kills that have 
happened on a room to room basis. This is so that if we die and reset, we 
take the current number of kills we had (say 5) and the number of killsthisroom
(say 2), then we'll know to reset kills to 3, because that's what we had when
we entered the room for the first time.

//=============================================================================
-Lmao according to Part 23 of the tutorial, GameMaker came out with an update that
basically fixed this problem; It automatically aligned the GUI with the App Surface
which is why we didn't really see the same problems he was having in Part 22. He
still suggested keeping these changes though, or else the game is gonna look all
stretched out
//=============================================================================
*/

TOGGLE_PAUSE = 0;
paused = false;
pause_sprite = noone;
gamefollow = obj_Player;
/*
-This is code from the Platform Shooter Tutorial series. Part 14 for pausing

-TOGGLE_PAUSE determines pausing or not in an event_user function

-paused checks what state our game is in, whether it is paused or unpaused

-'pause_sprite' is used to 'take a picture' of what our screen looked like
before we were paused. Otherwise, calling the instance_deactivate_all()
function stops the objects from drawing themselves so they disappear from 
the screen when we pause.
*/
/*
-Side Note for what event_user does:
	-With this function you tell the instance to run the actions 
	or code that has been placed within one of the 16 user defined 
	events. These events can only be called in this way, or using 
	the event_perform function.
*/