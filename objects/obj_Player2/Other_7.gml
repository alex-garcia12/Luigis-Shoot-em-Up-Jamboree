/// @description Footsteps

/*
-If our currently displayed sprite is the running sprite, then play the 
footsteps sfx. 

-choose lets us randomize our footstep sounds so we don't get the same sfx
every time the animation ends. choose will select a random sfx from the
parameters we gave it and audio_play_sound will play it once and with low
priority.
*/

if (sprite_index == spr_PlayerR2) 
{
	audio_play_sound(choose(sn_Foot1, sn_Foot2, sn_Foot3, sn_Foot4),1,false);
}
