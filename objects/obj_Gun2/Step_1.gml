/*
-Here we're constantly updating the gun's position to stick with the player's coordinates.
-We're also updating the gun's angle to match the mouse's position to properly aim.

-Starting with the first if statement is checking to see whether we're using 
keyboard or controller input. If controller == 0, then use mouse/keyboard controls
as we have been.
-else contains the controller input for aiming. We're declaring two var variables
of controllerh and controllerv. We're setting their values to whatever gp_axisrh and
gp_axisrv are, which return a value based on how much we move the right stick.
-The next if statement is for the deadzone. Pretty straightforward. controllerangle
is a variable that is being given the value of the point_direction function.

-The firing delay is there so we don't shoot insanely fast every frame
-max returns the larger of the two values within it's parameters. Say recoil = 3
at the time. In that case, it'll return 3 - 1 = 2 for the value. Really it's there
to make sure recoil stays at 0 rather than continuousy decreasing. I believe we set
the first set of coordinates to 0,0 to have sort of a reference point relative to the
second set of coordinates; in this case, controllerh and controllerv. That set of
coordinates is returning the point at which direction the stick is pointing. If
we're moving the right stick all the way up, then controllerangle = -1, etc.
*/

x = obj_Player2.x;
y = obj_Player2.y+3;


	var controllerh = gamepad_axis_value(4,gp_axisrh);
	var controllerv = gamepad_axis_value(4,gp_axisrv);
	
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2){
		controllerangle = point_direction(0,0,controllerh,controllerv);
	}
	image_angle = controllerangle;



firingdelay -= 1;
recoil = max(0,recoil - 1);

//=================================================================================

if (gamepad_button_check(4, gp_shoulderrb) ) && (firingdelay < 0) {
	
	recoil = 6
	firingdelay = 7;
	ScreenShake(1.2,10);
	audio_play_sound(sn_Shot,5,false);
	with (instance_create_layer(x,y,"Bullets",obj_Bullet)) {
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
		
		/* 
		-Here we're applying a speed of 25 to the bullet.
		-Additionally, the direction is based on the gun's current angle along 
		with a bit of a random range. Specifically, 'other' refers to the original 
		object we're in. In this case, we went from 'with bullet' to 'gun' so it's 
		gun's angle we're getting. 
		-Finally, image_angle = direction affects the angle at which 
		the bullet is gonna be drawn. Before we just adjusted the direction 
		of the shot but not the actual drawing.
		*/
	}
}

//=================================================================================

/*
-These are kinda weird. Rewatch the video (part 3) if needed but basically I think
lengthdir_x & lengthdir_y allow us to adjust a sort of offset for an object's position
in this case the gun's position. The parameters are (len,dir) so we chose the length
of the offset to be recoil (somewhere between 0 and 4 I believe) and the dir to be
image_angle. Typically just inserting image_angle would have the gun recoil 'away'
rather than 'against' the player, but that's why it's x - lengthdir_x(recoil,image_angle),
so I think we're getting the negative angle or rather the opposite of away.
*/

x = x - lengthdir_x(recoil,image_angle)
y = y - lengthdir_y(recoil,image_angle)

if(image_angle > 90) && (image_angle < 270){

	image_yscale = -1;
	
	//image_yscale helps us flip the gun right side up when we're facing left.
	//No more upside down gun when facing left!
}

else{
	image_yscale = 1;
	
	//Set image_yscale back to 1 if we're facing right so we don't flip it again.
}

//=================================================================================