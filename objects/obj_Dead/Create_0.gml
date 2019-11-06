hsp = 0;
vsp = 0;
grv  = 0.3;
done = 0;
ScreenShake(5,25);
image_speed = 0;
audio_play_sound(sn_Death,10,false);
/* 
-These variables are set for the enemy's death animation. they'll
get thrown up and over once they die.

-ScreenShake is here to shake the screen when an enemy dies. The
magnitude is larger than the gun firing so the enemy dying shake
will overwrite the gun's shake.

-image_speed is set to 0 so we can control the 2 frame death animation.
*/