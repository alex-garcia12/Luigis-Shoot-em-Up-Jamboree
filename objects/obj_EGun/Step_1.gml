/// @description 

x = owner.x;
y = owner.y-10;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(obj_Player))
{
	if(obj_Player.x < x) image_yscale = -image_yscale;
	if (point_distance(obj_Player.x, obj_Player.y,x,y) < 600)
	{
		image_angle = point_direction(x,y,obj_Player.x,obj_Player.y);
		countdown--;
		if(countdown <= 0)
		{
			countdown = countdownrate;
			if (!collision_line(x,y,obj_Player.x,obj_Player.y,obj_Wall,false,false))
			{
				//Bullet code here (copied from obj_Gun)
				//audio_sound_pitch(sn_Landing,choose(0.8,1.0,1.2));
				audio_play_sound(sn_Shot,5,false);
				with (instance_create_layer(x,y,"Bullets",obj_EBullet)) 
				{
					spd = 5;
					direction = other.image_angle + random_range(-3,3);
					image_angle = direction;
				}
			}
		}
	}
}

/*
-We set the x,y coordinates of the gun to the enemy that owns the gun. 

-We use image_xscale,yscale and set it to the abs of the image_xscale,yscale of the owner
so the gun's size properly reflects the size of the enemy. abs prevents negative numbers
so we don't flip the gun.

-First 'if' statement checks if the Player exists. 

-Second 'if' checks if the player's location is less than the gun's, aka to the left 
of the enemy/gun. If so, then flip the gun's appearance so it's not upside-down. 

-Third 'if' statement is basically used somewhat as a line of sight check. If the distance
between player's x,y and the gun/enemy's x,y is less than 600px, then set the angle
of the gun towards the player, aka aim at the player. Start the countdown once this 
is true and prep this variable so the gun can fire. Once countdown reaches 0 or less, 
then reset it to countdownrate, aka 40.

-Last 'if' is the actual line-of-sight check. If there's a would-be collision between
the gun and the player, then don't shoot. But if there is no would-be collision, then
it's weapons free for the enemies with guns.
*/