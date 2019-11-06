/// @description Make the gun float
y = ystart + sin(get_timer()/500000)*5;

/*
-We want our gun pickup to float. We start by setting our current y value
to equal the y value of where the gun starts, aka where it was set in the
room editor. We then add to that the sin() of get_timer().

-sin() will constantly change due to get_timer() changing every microsecond
or whatever the unit is. Specifically, it will alternate (I'm pretty sure)
between -1 and +1.

-get_timer() returns the amount of time that has passed in microseconds
since the game started. There's one million microseconds in a second, so
by dividing it by 500000, aka half, then we'll be getting a faster time

-Multiplying the whole thing by 5 gives it more 'floatiness'. If we left
it only to sin(), it would alternate between -1 and +1, as we would 
expect from a sin wave.
*/