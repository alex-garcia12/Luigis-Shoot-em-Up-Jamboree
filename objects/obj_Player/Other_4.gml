/// @description Auto Save

//Overwrite Old Save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//Create New Save
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file,room);
file_text_write_real(file,global.myscore);
file_text_write_real(file,global.hasgun);
file_text_close(file);

/*
-First we use an 'if statement' to check if we currently already have a save
file. If we do, then yeet it out of here.

-We then create a temporary variable file for writing purposes. We'll open 
file (which contains SAVEFILE which contains "Save.sav").

-Next in file_text_write_real(), we give it the arguments of file (the
file we wanna write to) and room (which actually is a real number. Each
room is given a real number value as an ID). room will change depending 
on which room we're in so it'll save accordingly.

-The second file_text_write_real() just saves our current number of kills we had
when the game saved last.
*/