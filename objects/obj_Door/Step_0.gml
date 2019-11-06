/// @description 

if (closed)
{
	y = Approach(y, ystart+(image_yscale * 32),2);
}
else y = Approach(y, ystart,2);

if (instance_exists(obj_Lock))
	{
		closed = true;
	}

else closed = false;

/*
-Check if the door is closed. If so, then set the y position
to move towards a closed door position. For example, if we're
talking about the top door, then it has a ystart, which is where
we first are before moving. Since Approach() is basically saying
move a to b by amount, we wanna move the door's y position to
ystart + image_yscale * 32. So essentially, we wanna move 32px
away from the start. image_yscale is there so we can apply this
too both doors depending if the door's are flipped or not. The
final '2' is to have the object move 2px at a time.
*/