//Get Player Input

if(hascontrol){
	key_left = 0;
	key_right = 0;
	key_jump = 0;
	//key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	//key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	//key_jump = keyboard_check_pressed(vk_space);

//if (key_left) || (key_right) || (key_jump) {

	//controller = 0;
//}

if (abs(gamepad_axis_value(4,gp_axislh)) > 0.2){

	key_left = abs(min(gamepad_axis_value(4,gp_axislh),0));
	key_right = max(gamepad_axis_value(4,gp_axislh),0);
	controller = 1;
}

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

if(gamepad_button_check_pressed(4,gp_shoulderl)){
	key_jump = 1;
	controller = 1;
}

}

else {
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}

//==============================================================//
//Calculate Movememnt
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

//==============================================================//
//Jumping
canjump -= 1;
if(canjump > 0) && (key_jump){

	vsp = -8;
	audio_play_sound(sn_Jump,5,false);
}

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

	while(!place_meeting(x,y+sign(vsp),obj_Wall)){
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

//==============================================================//
#region //Animation
if(!place_meeting(x,y+1,obj_Wall)){
	
	sprite_index = spr_PlayerA2;
	image_speed = 0;
	if(sign(vsp) > 0) image_index = 1; else image_index = 0;
}

else 
{
	canjump = 10;
	if (sprite_index == spr_PlayerA2) 
	{
		audio_sound_pitch(sn_Landing,choose(0.8,1.0,1.2));
		audio_play_sound(sn_Landing,4,false);
	}
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = spr_Player2;
	}
	else 
	{
		sprite_index = spr_PlayerR2;
	}
}

if(hsp != 0) image_xscale = sign(hsp);
#endregion
//==============================================================//
//Custom Cursor

window_set_cursor(cr_none)
cursor_sprite = spr_CustomCursor;
