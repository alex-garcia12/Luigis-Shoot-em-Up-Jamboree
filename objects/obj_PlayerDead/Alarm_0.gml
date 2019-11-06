/// @description Reset Game Speed and Room

game_set_speed(60, gamespeed_fps);
SlideTransition(TRANS_MODE.GOTO,room);

/*
-Once we finish dying (i.e. hit the ground dead) then reset the fps
back to 60 and then SlideTransition back into the current room.
*/
