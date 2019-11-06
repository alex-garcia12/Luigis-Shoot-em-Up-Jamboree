/*
-Instead of setting the speed of the bullet using the reserved 'speed' variable inside
the Gun object, we changed that variable to a new 'spd' variable. Here in the Bullet
object, we're now guiding the bullet using lengthdir_x,y. This basically allows us to
use trig to determine where the bullet will fly. Rather than just giving it 'speed'
and 'direction', we're changing the x,y coordinates of the bullet.

-Also this is a Step event because we want the bullets to disappear about a frame
just before colliding with a wall. This is so the HitSpark can look better.
*/

x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

//=======================================================================
/*
-This section was cut out in Part 21 around 18:30 because we don't need
it for the enemy bullets. Specifically, that section (you can check out
this section that was duplicated in obj_Bullet) was checking if a bullet
collided with a shootable thing thanks th p_Shootable. At the moment of
writing this comment, the only shootables we have are enemies and crates.
Not only would these enemies that are wielding guns have bullets colliding
with themselves, but they would end up shooting crates, etc.
*/

/*
-When using 'other' OUTSIDE of the 'with' braces, we are referring to that particular
instance of that object. Since we're in a collision event with obj_enemy, with(other)
is having a bullet collide with that particular enemy that was hit. An enemy getting 
hit triggers this event which will execute the code inside the 'with' block.

-We now have an 'other' INSIDE the 'with' block. Since this is the case, this particular
'other' is referring to the original object, aka the object this event is in; in this
case, it's obj_Bullet. So hitfrom = other.direction is setting hitfrom to the direction
of where the bullet collided with the enemy.
*/

/* 
-instance_destroy() is here to destroy the bullet after the collision with the enemy. 
If it was inside the 'with' block then the enemy would be destroyed too. Additionally,
we have instance_destroy() because if it wasn't here, the code within the 'with' block
would execute every frame the bullet collides with the enemy, which may be multiple 
times at once which we don't want. We want it to be a one-and-done thing.
*/

//==========================================================================================

//Stuff in Post-Draw happens AFTER all the drawing and rendering has finished
if (place_meeting(x,y,obj_Wall)) && (image_index != 0)
{
	while (place_meeting(x,y,obj_Wall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd = 0;
	instance_change(obj_HitSpark,true);
} 

/*
-If a bullet collided with the wall, then change this bullet instance to a HitSpark
object. True will execute the events within HitSpark.

-Without the while loop, we can see our spark when bullets collide with the wall but
most of the time the spark appears inside the wall. This while loop checks what while
our bullet is colliding with the wall, change its x,y coordinates (subtract by 1 and
move in the direction it came from) until it is no longer colliding. Once that's the
case, change into the HitSpark.
*/

//==========================================================================================

/*In Part 19 of the tutorial series, around 28:30, he has this same code
but a tiny bit different and also in a begin step event rather than the
Post-Draw event like we have here. Seems fine for now but if something 
goes wrong then maybe check here.

-Also, everything above the commented line separator thingy was cut and pasted
from the p_Shootable event that is now deleted. Again, this all may have to be
changed into a Begin Step event if something goes wrong.

**Change** - In Part 20, he changed this event to a Step event.
*/