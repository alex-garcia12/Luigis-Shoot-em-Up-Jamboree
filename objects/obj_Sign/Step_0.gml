/// @description Insert description here

if (instance_exists(obj_Player) && point_in_circle(obj_Player.x,obj_Player.y,x,y,64)) && (!instance_exists(obj_Text))
{
	nearby = true;
	counter += 1;
	
	if (keyboard_check_pressed(ord("W")))
	{
		with (instance_create_layer(x,y-64,layer,obj_Text))
		{
			text = other.text;
			length = string_length(text);
		}
	
		with(obj_Camera)
		{
			follow = other.id;
		}
	}
}
else nearby = false;

/*
-First we check if the player exists, if the player's x,y coordinates are within 64px of a sign, and if there
is currently no already existing sign text.

-Set nearby = true because the player is now nearby the sign.

-Check if the player presses 'W' to read the sign

-If 'W' is pressed, create an instance on the current layer the Sign is on, which should be the Entities
layer. Specifically, place the text object 64px above the sign.

-Set the 'text' to be the obj_Text's text (whatever string we have in the creation code for that particular
sign in that room) and set the length to be the length of that text.

-Have the camera follow the text and focus there for the duration of the text.

-If we're not nearby, then set 'nearby' to false.
*/