/// @description 

countdownrate = 40;
countdown = countdownrate;
if (global.hasgun == false) instance_destroy();

/*
-countdownrate is just gonna represent when the next time the enemy will be able to fire.
-We're using countdown as a way to avoid using magic numbers. Seems kinda redundant
but just go with it.

-Check if the player has the gun (if hasgun is true). If not, then enemies will
not be given guns either.
*/