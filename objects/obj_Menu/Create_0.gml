/// @description GUI/Bars/Menu setup

/*
-Get the GUI width and height so it's dynamic across different systems
and resolutions. No magic numbers.

-Establish a margin so we have about one tile's worth of space to work
with so we're not working right at the edge.

-menu_x is originally given a value that is actually off the screen to
the right (200px off). This is so we can include a little animation so
the menu selection stuff slides in from the right into place. Similar
reasoning applies to the menu_y.

-menu_target is where we want the text to end up. Specifically, we 
wanna end up at the target, which is 32px to the left of the GUI width.

-menu_speed, font, and itemheight are self-explanatory. font_get_size
is just used so our text saves it's attributes throughout. No
overlapping and whatnot.

-menu_committed is a variable who's value will be changed as a certain
menu item is selected. So if we select 'New Game' or something
then menu_committed will equal 1 for example. We'll then check to see
if they select it, and if so, do whatever we wanna do when this
variable equals 1. Default is -1 because we're not initially committed
to anything.

-menu_control is just a bool that determines whether the player has
control over the menu or not once they select an option on the list.
Disable control once they select something.

-menu[] is our array that will contain our text that will be displayed
on the in-game menu.

-menu_items determines the number of items within the array, aka the
length of the array.

-menu_cursor is used for the 'hovering over' aspect of the menu when
the cursor hovers over a menu item.

-menu_top gives us the top of the menu, dynamically. It accounts for
the number of menu items, the height of the font should we change it,
and the little gap of space between each menu item.

-This macro is given the name SAVEFILE. It essentially just holds text
saying "Save.sav". Whenever we wanna access this file, then we just
say SAVEFILE wherever we want. Also, Save.sav is essentially just
a text file that's gonna hold our save info.
*/

#macro SAVEFILE "Save.sav"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25;	//lower is faster
menu_font = f_Menu;
menu_itemheight = font_get_size(f_Menu);
menu_committed = -1;
menu_control = true;

menu[3] = "New Game";
menu[2] = "Continue";
menu[1] = "Survival";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

menu_cursor = array_length_1d(menu) - 1;