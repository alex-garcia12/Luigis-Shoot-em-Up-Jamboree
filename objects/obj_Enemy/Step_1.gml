if (hp <= 0){

	with(instance_create_layer(x,y,layer,obj_Dead)) {
	
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction) - 2;
		if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
		image_yscale = other.size;
	}
	
	with(mygun) instance_destroy();
	if(instance_exists(obj_Player))
	{
		//global.kills++;
		//global.killsthisroom++;
		global.myscore += point_value;
		global.scorethisroom += point_value;
		with (obj_Game) killtextscale = 2;
	}
	
	instance_destroy();
}

/*
-This is all checking once an enemy has been shot enough so the hp is <= 0.
-with(instance_create_layer(x,y,layer,obj_Dead)) creates a new instance of the enemy but
in a dead state, rather than a normal enemy state. It takes it's current x,y coordinate,
along with the current layer (enemy layer) and creates an object based on those parameters,
in this case obj_Dead.

-direction = other.hitfrom determines the direction the body will fly. It gets the 
direction from 'other', with 'other' being the bullet. If the bullet is flying left,
then the body will fly left. 

-hsp = lengthdir_x(3,direction) is the weird trig thing again. In the x direction, the
body will fly 3 pixels away in the given direction. So imagine like a ball being thrown
at different angles and lengths. The angle and length work together to determine where
the ball will land. If it helps clear things up, you can think of the length as the 
'power' the ball is being thrown; or how far the body will go.
-vsp is the same as hsp only in the y direction. Additionally, the - 2 gives the 
body a little jump once the enemy runs out of hp.

-if (sign(hsp) != 0) image_xscale = sign(hsp). This is used to check and prevent an
unlikely problem to happen where an enemy is shot straight up or down. Originally,
we didn't have a check for sign(hsp) = 0 so this is used to prevent that small prob.
We also multiply sign(hsp) by size so the size of the enemy stays consistent.

-with(mygun) destroys the EGun instance once the enemy's health hits 0

-We set the score increasing inside an 'if' so the player doesn't get more score for
landing a killing shot in the off chance that they die and that killing shot is still
flying and kills an enemy while the player is technically dead.

-killtextscale is set to 2 so we have that neat little expanding effect applied to the
text of the score whenever the score is increased. Also this is not global like the 
others because this is like the one and only time this is used so we don't want it
to be accessed anywhere else.

-Lastly, destroy the instance of obj_Enemy, as it is now obj_Dead
*/