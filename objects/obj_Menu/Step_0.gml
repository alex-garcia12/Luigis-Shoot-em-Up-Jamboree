/// @description Control Menu

/*
-In Item Ease In, we're giving the menu's x coordinate some movement.
We have it's x coordinate initialized to 200px off the screen to the
right. The target, which is where we wanna end up, is 32px away from
the right of the GUI width. So we get there by slowly adding to menu's
x-coordinate a negative number. Thanks to dividing by menu_speed, we
start moving fast and slowly end up at the target as it gets closer to
the desired target.
*/

//Item Ease In
menu_x += (menu_x_target - menu_x) / menu_speed;

//===================================================================
//Keyboard Controls

/*
-The first 'if' statement checks if keyboard_up has been pressed. If
it has, then increase the menu_cursor. Remember we set the text from
the bottom-up so the lowest text is 0, next text up is 1, etc. 
Additionally, we also check if menu_cursor ends up being higher than
the number of menu_items we have. If so, drop back down to 0 so we
loop around to the lowest text. All this applies to keyboard_down too,
just in the opposite direction.

-We also check if keyboard_enter has been pressed. If so, we want to do
that particular thing.

-First we establish a new menu target so the screen slides back off the
screen. 

-We then set menu_committed to whatever we selected, aka menu_cursor.
This way we know what selection was made. We then screen shake because
why not. Only it doesn't work for some reason.

-Then we set the menu_control to false so we're no longer able to
control the menu anymore. 

-We also wanna allow the player to make selections using the mouse.
We make a temporary variable named mouse_y_gui and set it equal to
the y coordinate of where our mouse is. We use device_mouse_y_to_gui()
because this gives us the y coordinate of the mouse on the GUI. Since
we're drawing onto the GUI, we wanna use this. Using the reserved
mouse_y variable gives us the y coordinate for the room, not the GUI.

-The last 'if' statement checks if the mouse position is below the top
of the menu and above the bottom of the menu.

-We then set mouse_cursor to (menu_y - mouse_y_gui). So the bottom of
the screen (like 1024 or something) minus where we have the mouse. If
our mouse position was like 1000, then it would be 24. We then div 
that value (div btw means divide and give us the whole number, no
remainder) by the menu_itemheight aka the font height, times 1.5
which is our bit of space between menu items. This should give
us our new menu cursor which should highlight our selection.
*/

if (menu_control) 
{
	if (keyboard_check_pressed(vk_up)) || keyboard_check_pressed(ord("W"))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
		audio_play_sound(sn_Fireball,5,false);
	}
	
	if (keyboard_check_pressed(vk_down)) || keyboard_check_pressed(ord("S"))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items - 1;
		audio_play_sound(sn_Fireball,5,false);
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
	{
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
		menu_control = false;
		audio_play_sound(sn_Coin,5,false);
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var mouse_x_gui = device_mouse_x_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) && (mouse_x_gui > menu_x - 200)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		if (mouse_check_button_pressed(mb_left))
		{
			menu_x_target = gui_width + 200;
			menu_committed = menu_cursor;
			ScreenShake(4,30);
			menu_control = false;
			audio_play_sound(sn_Coin,5,false);
		}
		//audio_play_sound(sn_Fireball,5,false);
	}
}


//====================================================================
//What Happens Next

/*
-Check if the menu is properly off screen and if we actually committed
to a choice (0,1,2, etc). 

-A switch statement is executed which determines what will happen 
(like which transition or function will happen) based on the currently
selected item, aka the menu_committed.

-Choose New Game, you transition to the next room, aka RoomOne aka
the start of the game.

-Choose Continue and pick up where you last left off.

-Choose Quit and the game closes.

-Case 1 checks the Continue option. If we choose Continue and 
there's no file to load, then transition into the next room
which would be room 1. Otherwise, if it does exist, open the
file, and then use target to read a real number, in this case,
it would be whatever room we last left off on. Then close.
*/

if (menu_x > gui_width + 150) && (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 3: SlideTransition(TRANS_MODE.NEXT); break;
		case 2: 
		{
			if (!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT);
			}
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				global.myscore = file_text_read_real(file);
				global.hasgun = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO,target);
			}
		}
		break;
		
		case 1: 
		{
			var target = r_Waves;
			SlideTransition(TRANS_MODE.GOTO, target); break;
		}
		case 0: game_end(); break;
	}
}