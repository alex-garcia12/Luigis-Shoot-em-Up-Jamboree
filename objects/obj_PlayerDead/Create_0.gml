hsp = 0;
vsp = 0;
grv  = 0.2;
done = 0;

image_speed = 0;
image_index = 0;

ScreenShake(5,25);
audio_play_sound(sn_PlayerDead,10,false);
game_set_speed(30,gamespeed_fps);

with (obj_Camera) follow = other.id;

/* 
-These variables are set for the player's death animation. they'll
get thrown up and over once they die.

-ScreenShake is here to shake the screen when the player dies. The
magnitude is larger than the gun firing so the player dying shake
will overwrite the gun's shake.

-image_speed is set to 0 so we can control the 2 frame death animation.

-game_set_speed is used for the slow motion effect we get when the 
player dies. It does so by setting the fps of the game to 30fps
for the duration of the death animation.

-We establish the 'with' statement here with the camera because we
wanna make sure the camera still knows that obj_PlayerDead is still
actually obj_Player. We do this by telling it to follow the ID of
the object that it became, in this case, player became playerdead.
*/