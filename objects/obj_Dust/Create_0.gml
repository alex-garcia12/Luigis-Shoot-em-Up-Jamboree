/// @description 

image_speed = random_range(0.5,1);
image_index = random_range(0,6);
hsp = random_range(-2,2);
vsp = random_range(-2,2);
image_xscale = choose(1,-1);
image_yscale = choose(1,-1);

/*
-image_speed is randomized so we could get faster or slower dust effects.

-image_index is randomized so we start on a random frame for a more natural
look to the effect.

-We also randomize the horizontal/vertical speed so the dust poofs out at
differing/random speeds.

-image_xscale,yscale allows for the sprite to be flipped horizontally or 
vertically or not. Adds a little more variety to the effect.
*/