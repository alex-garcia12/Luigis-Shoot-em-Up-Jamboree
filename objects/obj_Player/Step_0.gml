//Get Player Input

if(hascontrol){
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
key_shift = keyboard_check(vk_shift);



if (key_left) || (key_right) || (key_jump) {

	controller = 0;
}

if(onground) show_debug_message("onground");
if(!onground) show_debug_message("not onground");
if(onwall) show_debug_message("onwall");

/*if (abs(gamepad_axis_value(4,gp_axislh)) > 0.2){

	key_left = abs(min(gamepad_axis_value(4,gp_axislh),0));
	key_right = max(gamepad_axis_value(4,gp_axislh),0);
	controller = 1;
}*/

/*
-Here we're checking for horizontal controller input from the left analog stick.
The parameters inside gamepad_axis_value: 0 determines what player slot, and 
gp_axislh determines the axis index. The axis index is asking for which stick
and which axis we want; in this case, we're going for left analog stick in the
horizontal direction. We are also checking for > 0.2 for a deadzone. Holding
all the way left or right gives a value of -1 and 1 respectively. We're 
specifying here that the stick value must be > 0.2 before the block of code 
inside the if statement actually executes. We don't want the character to move 
if we're super barely hardly even touching the stick.

-Inside the 'if' block, we're overriding key_left and key_right with the value
our controller is returning. We're also returning positive values for key_left.
We're doing these things so it can work just fine with our current code, 
specifically, the var move bit of code. The min of gamepad_axis_value works 
for key_left because it will return the min of stick value or 0. If we're moving
-0.7 (in the left direction) then the min value to return will be -0.7 as it is
less than zero. Same concept applies to key_right only we don't need the abs
as it is already positive and we're using max since we want > 0 to move in the 
right direction.
*/

/*if(gamepad_button_check_pressed(4,gp_shoulderl)){
	key_jump = 1;
	controller = 1;
}*/

}

else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}
var run = false;
//==============================================================//
//Calculate Movement
switch(state)
{
	case pState.normal:
	{
		if keyboard_check_pressed(ord("F"))
		{
			image_index = 0;
			state = pState.roll;
		}
		
		walljumpdelay = max(walljumpdelay-1,0);
		
		if(walljumpdelay == 0)
		{
			var move = key_right - key_left;
			//image_speed += 1
			//hsp = (move * walksp) + gunkickx;
			//hsp = (move * walksp) + gunkickx;

			hsp += (move * hsp_acc); //+ gunkickx;
			if (move == 0)
			{
				var hsp_fric_final = hsp_fric_ground;
				if (!onground) hsp_fric_final = hsp_fric_air;
				hsp = Approach(hsp,0,hsp_fric_final);
			}

			hsp = clamp(hsp, -walksp, walksp);
			gunkickx = 0;
		}
		//================================================================
		//Wall Jump
		if (onwall != 0) && (!onground) && (key_jump)
		{
			walljumpdelay = walljumpdelay_max;
			hsp = -onwall * hsp_wjump;
			vsp = vsp_wjump;
			hsp_frac = 0;
			vsp_frac = 0;
			audio_play_sound(choose(sn_Walljump1, sn_Walljump2, sn_Walljump3, sn_Walljump4, sn_Walljump5), 10, false);
		}
		//================================================================
		var grv_final = grv;
		var vsp_max_final = vsp_max;

		if (onwall != 0) && (vsp > 0)
		{
			grv_final = grv_wall;
			vsp_max_final = vsp_max_wall;
		}

		vsp = (vsp + grv_final) + gunkicky;
		vsp = clamp(vsp, -vsp_max_final, vsp_max_final);
		gunkicky = 0;

		if (key_shift) && (state != pState.swing) && (state != pState.roll) run = true;
		if (run == true) 
		{
			walksp = 7; 
		}
		else 
		{
			run = false;
			walksp = 4;
		}
		/*
		-hsp += move * hsp_acc is our main determining factor for movement. We change
		hsp depending on where we're going (negative for left, positive for right). We 
		also multiply our direction by our horizontal acceleration (hsp_acc).

		-This 'if' checks if we're not pressing any keys, left or right. If it is 0,
		start by creating a temporary variable

		-var hsp_fric_final will be used to change into either ground friction or air
		friction (horizontally).

		-If 'onground' is false, it means we're in the air so change our var to be
		air friction. 

		-We then set our hsp to the value that the Approach() function returns. This
		function asks for a source, then destination, and an amount to shift. Basically,
		move 'a' towards 'b' by 'amount'.

		-After all the ifs and such, set hsp to clamp within the range of -walksp and
		+walksp. This way we can go only so fast.
		*/

		//============================================================================
		//Old Way of Movement (still applies for the most part
		/*
		-Set move equal to whether we're going left or right. So move will be 1
		(for going right), -1 (for going left) or 0 if both keys are held.

		-Set the player's horizontal speed to move * walkspd so we get the speed
		we actually wanna move rather than just 1, -1, or 0. Also add gunkickx
		if we're firing.

		-Do the same for our vertical speed only with gravity rather than 'move'.
		Also add gunkicky if we're firing.

		-Reset both instances of gunkick to 0 so we have kickback every frame we're
		firing.
		*/

		//if (hsp > 0)
		//{
		//	repeat(1)
		//	{
		//		with(instance_create_layer(x,bbox_bottom,"Bullets",obj_Dust))
		//		{
		//			image_xscale = choose(1,-1);
		//			image_yscale = choose(1,-1);
		//			hsp = -4;
		//		}
		//	}
		//}

		//==============================================================//
		//Jumping
		canjump -= 1;
		if (canjump > 0) && (key_jump)
		{
			vsp = vsp_jump;
			canjump = 0;
			vsp_frac = 0;
			audio_play_sound(sn_Jump,5,false);
		}
		vsp = clamp(vsp, -vsp_max, vsp_max);

		if (mouse_check_button_pressed(mb_right))
		{
			grappleX = mouse_x;		//Get the x coordinate of where we clicked
			grappleY = mouse_y;		//Same as above
			
			if(place_meeting(grappleX,grappleY, obj_Block))
			{
				ropeX = x;				//This is the end of the rope where the player is on
				ropeY = y;				//Same as above
				ropeAngleVelocity = 0;	//How quickly we're swinging
				ropeAngle = point_direction(grappleX,grappleY,x,y); //This gives us the angle from where the player is to the grapple point
				ropeLength = point_distance(grappleX,grappleY,x,y);  //Gives us the distance between the player end and the grapple point
				state = pState.swing;	//We are now swinging
			}
		}

	}break;
	
	case pState.swing:
	{
		sprite_index = spr_PlayerWall;
		var run = false;
		var _ropeAngleAcceleration = -0.2 * dcos(ropeAngle);	//0.2 is a magic number. Could adjust based on preference, but make sure it's negative. Also maybe change it into a variable if preferred.
		_ropeAngleAcceleration += (key_right-key_left) * 0.08;	//Allows us to influence where we swing
		ropeLength += (key_down - key_up);					//Adjusts the ropeLength so it keeps up with our inputs and influence
		ropeLength = max(ropeLength,0);							//Ensures we have some rope if our player is like right next to the click point. So we don't have negative rope or a really short rope
		ropeAngleVelocity += _ropeAngleAcceleration;			//Adjust our speed based on the _ropeangleacceleration. Constantly changes based on position on the 'circle'
		ropeAngle += ropeAngleVelocity;							//Add to the rope angle our velocity
		ropeAngleVelocity *= 0.99;								//This is a dampener. This allows us to slowly slow down and come to a stop if we stop holding a direction to swing.
		
		ropeX = grappleX + lengthdir_x(ropeLength, ropeAngle); 
		ropeY = grappleY + lengthdir_y(ropeLength, ropeAngle);
		
		hsp = ropeX - x;	//Adjust the player speed based on rope physics
		vsp = ropeY - y;	//It gives us the difference of where the rope should be and of where the player is. We do it this way to help with our collision checking
		
		
		if(mouse_check_button_released(mb_right))
		{
			state = pState.normal;
			vsp_frac = 0;
			//vsp = vsp_jump;
			
		}
	/*
	-var _ropeAngleAcceleration will store the value of how fast the player is accelerating along 
	the angles of the circle due to the behavior of pendulums.
	
	-dcos() gives us the vaule in degrees. Recall that cosine, at 0 degrees, starts at 1. 
	If we're facing right (aka 0 degrees), cosine will return 1. Since we're multiplying by -0.2,
	then we'll get a negative acceleration, pulling us to the left. Which is what we want, because
	if we're swinging right, we're gonna want a pullback feel to it. Same goes for the left, only
	we'll get a positive acceleration, pulling us to the right. If we're straight up, then our
	acceleration will be 0, which means our velocity won't be affected within that moment of time
	
	-ropeX is the grapple point. We set it equal to grappleX + lengthdir_x(ropelength, ropeangle).
	This function gives us the straight line from one end of the rope (Player end) to the grapple
	point (mouse click). Same goes for y coordinate
	*/
	
	}break;
	
	//Rolling
	case pState.roll:
	{
			sprite_index = spr_PlayerRoll;
			image_speed = 1;
			
			if (image_xscale == 1) && (!place_meeting(x+4, y +4, obj_Wall))
			{
				x+=4;
			}
			
			if (image_xscale == -1) && (!place_meeting(x+4, y+4, obj_Wall))
			{
				x-=4;
			}
	} break;
}


hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;

show_debug_message("State: " + string(state));
/*
-He quickly skims this part but I think this part (starting with
hsp += hsp_frac) just helps us get more precise movements when 
dealing with moving left or right with acceleration/friction.
Helps with rounding, subpixels, etc.
*/

//==============================================================//
//Horizontal Collision
if (place_meeting(x+hsp,y,obj_Wall))
{
	while(!place_meeting(x+sign(hsp),y,obj_Wall))
	{
		x += sign(hsp);
	}
	
	if (state == pState.swing)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y);	//This keeps our rope with us if we collided with something horizontally
		ropeAngleVelocity = 0;	//Sets our rope speed to 0 if we collided horizontally
	}
	
	hsp = 0;
}
x += hsp;

//==============================================================//
//Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall))
{
	while(!place_meeting(x,y+sign(vsp),obj_Wall))
	{
		y += sign(vsp);
		onground = true;
	}
	
	if (state == pState.swing)
	{
		ropeAngle = point_direction(grappleX,grappleY,x,y);	//This keeps our rope with us if we collided with something horizontally
		ropeAngleVelocity = 0;	//Sets our rope speed to 0 if we collided horizontally
	}
	
	vsp = 0;
	
}
y += vsp;

//==============================================================//
#region //Animation

var aimside = sign(mouse_x - x);
//Check if the x position of the mouse is greater than the player's
//x position. Assign the sign of that variable accordingly. +1 for 
//facing right, -1 for facing left.
if(aimside != 0) image_xscale = aimside;
onwall = place_meeting(x+1,y,obj_Wall) - place_meeting(x-1,y,obj_Wall);	//Check if there's a wall to the left or to the right of us

if(!place_meeting(x,y+1,obj_Wall))
{
	onground = false;
	if(onwall != 0)
	{
		sprite_index = spr_PlayerWall;
		image_xscale = onwall * -1;			//flip the sprite according to the wall. If we're stuck in the wall then come back here.
		
		var side = bbox_left;
		if (onwall == 1) side = bbox_right;
		dust++;
		if ((dust > 2) && (vsp > 0)) 
		{
			with (instance_create_layer(side, bbox_top, "Bullets", obj_Dust))
			{
				other.dust = 0;
				hspeed = -other.onwall*0.5;
			}
		}
	}
	else if (state = pState.normal)
	{
		
		dust = 0;
		sprite_index = spr_PlayerA;
		image_speed = 0;
		
		if (keyboard_check_pressed(ord("S"))) 
		{
			while(groundpoundtimer >= 0) {
				grv = 0;
				groundpoundtimer--;
				show_debug_message("Timer: " + string(groundpoundtimer));
				show_debug_message("Gravity: " + string(grv));
			}
			
			if(groundpoundtimer <= 0)
			{
				//grv = 0.3;
				vsp += 10;
				hsp = 0;
				show_debug_message("hello");
			}
			groundpoundtimer = 60;
			grv = 0.3
		}
		//grv = 0.3;
		if(sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
}

else 
{
	canjump = 10;
	if (sprite_index == spr_PlayerA) 
	{
		audio_sound_pitch(sn_Landing,choose(0.8,1.0,1.2));
		audio_play_sound(sn_Landing,4,false);
		repeat(5)
		{
			with(instance_create_layer(x,bbox_bottom,"Bullets",obj_Dust))
			{
				image_xscale = choose(1,-1);
				image_yscale = choose(1,-1);
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = spr_Player;
	}
	
	if(state = pState.roll)
	{
		image_index = spr_PlayerRoll;
		image_speed = 0.6;
		show_debug_message("HI");
	}
	
	else 
	{
		sprite_index = spr_PlayerR;
		if(aimside != sign(hsp)) sprite_index = spr_PlayerRb;
		if (run == true) image_speed = 2;
	}
}

#endregion
//==============================================================//
//Custom Cursor

window_set_cursor(cr_none)
cursor_sprite = spr_CustomCursor;


