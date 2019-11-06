/// @description 
if (invincible == false) 
{
	global.hp -= 25;
	flash = 30;
	audio_play_sound(sn_Death,5,false);
	HitPlayer();
	ScreenShake(25,30);

	if (global.hp <= 0) 
	{
		//ini_open("highscore.ini");
		//ini_write_real("Scores", "Points", global.myscore);
		//var highscore = ini_read_real("Scores", "highscore", 0);
		
		//if (global.myscore > highscore)
		//{
		//	ini_write_real("Scores", "highscore", global.myscore);
		//}
		//ini_close();
		
		//var hfile = file_text_open_read(HIGHSCORES);
		//if (global.myscore > global.highscore)
		//{
		//	file_text_open_read(HIGHSCORES);
		//	file_text_write_real(HIGHSCORES, global.myscore);
		//}
		//file_text_close(hfile);
		KillPlayer();
	}
	
	invincible = true;
	alarm[1] = 90;
}
with(other) instance_destroy();

//Kill the player once a bullet has collided with the Player
//The 'with (other)' statement references 'other' with 'other' being
//obj_EBullet. After the collision, destroy the bullet.