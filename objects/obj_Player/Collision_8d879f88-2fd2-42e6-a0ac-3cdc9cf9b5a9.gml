if (global.hasgun)
{
	if (invincible == false)
	{
		global.hp -= 10;
		flash = 30;
		audio_play_sound(sn_Hit,5,false);
		HitPlayer();
		ScreenShake(4,30)
		
		invincible = true;
		alarm[1] = 90;
	}
}

if (global.hasgun) && (global.hp <= 0) 
{
KillPlayer();
}

//Check if the player has a gun. If so, then kill the player when the player 
//collides with an enemy.