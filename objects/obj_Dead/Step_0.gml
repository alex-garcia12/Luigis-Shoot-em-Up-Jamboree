if(done == 0) {
	vsp = vsp + grv;

//==============================================================//
//Horizontal Collision
	if (place_meeting(x+hsp,y,obj_Wall)){

		while(!place_meeting(x+sign(hsp),y,obj_Wall)){
			x += sign(hsp);
		}
		hsp = 0;
	}
	x += hsp;

//==============================================================//
//Vertical Collision
	if (place_meeting(x,y+vsp,obj_Wall)){
		if(vsp > 0) {
			done = 1;
			image_index = 1;
		}
		
		while(!place_meeting(x,y+sign(vsp),obj_Wall)){
			y += sign(vsp);
		}
		vsp = 0;
	}
	y += vsp;
}

/*
-Vertical collision checks our current x position and y position plus
our vertical speed so we check a tiny bit after our y position, and
finally checks if those coordinates met with a wall.
-The next if statement with 'done' in it sets done = 1 if the enemy is
dead. That line is just for the small death animation where they get 
thrown in the air and land dead on the ground. This is so that once
that happens, this whole collision checking thing is done and is no
longer constantly checking if the dead guy is colliding with anything.
*/