/// @description 

spd = 0.45;
letters = 0;
text = "this is a test string!\nSecond line!";
length = string_length(text);
text_current = "";
w = 0;
h = 0;
border = 10;

/*
-spd is gonna represent the speed at which we're writing text. Specifically, it's 
being written at '0.25' characters per frame, aka one character per 4 frames.

-letters represents the number of characters we have left to write in the string.

-text is gonna hold our actual string message.

-length holds the number of characters or 'length' of the string within 'text'.

-text_current holds the currently displayed string. For example, if we have a
string that says "this is a test", and letters (the variable that holds the
number of characters we have left to write) is currently equal to 4, that means
we're 4 characters deep into the "this is a test" string, so text_current would
hold the value of the first 4 characters, which would be "this".

-w & h represent the width and height of the text.
*/