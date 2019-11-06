if (invincible == false)
	{
		global.hp -= 25;
		flash = 30;
		audio_play_sound(sn_Death,5,false);
		HitPlayer();
		ScreenShake(4,30)
		
		invincible = true;
		alarm[1] = 90;
	}
	
if (global.hp <= 0) 
{
KillPlayer();
}
