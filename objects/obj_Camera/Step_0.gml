/// @description Update Camera

//Update Destination

/*
-Here we're checking if at least one of the instance within the parameters exists. For
now, we have follow = obj_Player, so we're checking if a player object exists. In
essence, we're checking if the player is alive.
-If the player is alive, then give the camera coordinates the player coordinates.

-If the player is DEAD then we wanna check that. So if the camera is now following a
dead player, set the camera's coordinates to center on the dead player.
*/

if (instance_exists(follow)){

	xTo = follow.x;
	yTo = follow.y;
	
	//if(instance_exists(obj_PlayerDead)) && (!instance_exists(obj_Player2Dead))
	//{
	//	follow = obj_Player2;
	//}
	
	//if(instance_exists(obj_Player2Dead)) && (!instance_exists(obj_PlayerDead))
	//{
	//	follow = obj_Player;
	//}
	
	//else follow = obj_Player;
	
	if((follow).object_index == obj_PlayerDead)
	{
		x = xTo;
		y = yTo;
	}
}

//====================================================================================
//Update Object Position

/*
-So here we have xTo. That's the position we wanna move to, and we're subtracting the
position we're currently at, and dividing by 25. Say xTo is 400, and x is 200, then
we end up with -200 so it's in the left direction. Overall, it moves us (the player?)
1/25th of the distance between our current position and the position we wanna be in.
This all helps with helping the camera move smoothly rather than snap from position
to position. 

-We use clamp to stop the camera from going too far left, right, or down (maybe even
up too). It does this by having us choose a value to adjust, and a range of how far
we'll allow the camera to go. The first x parameter is the value we wanna adjust, 
which is the camera position. Next we wanna restrict the camera to scroll between half of 
the viewport (width and height), and the entire room width/height - half the viewport
in both width and height. This will result in the camera stopping once we've reached
this point in the game; too far left of the game room, and the camera will stop and 
show only a little bit of the 'beyond' left. Same goes for the right side. As for
height, the camera still follows as we go up, but only goes so far down. It will not 
follow us if we go too far down, aka fall off the map.

-buff is added and subtracted to the view variables so we have a buffer. Before
we included buff, the screen shook far enough that we could see a bit of level 
outside of what we're supposed to see. buff stops that by basically 'removing'
a set number of pixels (32 in this case which is one tile's worth) from the clamp
so we don't see that far. The clamp has been moved further in, so to speak.
*/

x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//==================
//Screen Shake

/*
-We're adding to x,y a random range between -shake_remain and +shake_remain.
Specifically, this is currently set to -6 and positive 6, so it'll return a random
number within that range. This way the shake is more natural and random.

-Remember that we wanna decrement shake_remain every frame so the shake dwindles
and eventually stops. We also don't want it to be negative so we set it to a max.
We divide 1 by shake_length (1/60) to give us 1/60th of our total magnitude. So
we'll end up getting our 'peak' magnitude every frame for 60 frames.
*/

x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//====================================================================================
//Update Camera View

/*
-Here we're setting the position of the camera view. The first parameter is asking for
a camera, which is the viewport we set. The x,y coordinates are being set to the top
left of the viewport. We're subtracting the x,y by those view variables so we actually
have the camera focused on the player, rather than having the player on the top-left
of the camera.

-We're also checking to see if our mountainlayer exists. If so, then change that layer's
x coordinate. If we set the x coordinate to just x, then the mountain layer would always
stay in one place, static, while everything else (trees, camera, etc) moves along. We 
wanna set it to x/2 so the mountains move half as fast as the camera so it looks pretty
natural as we move along the level with a scrolling tree layer and even slower scrolling
mountain layer.
*/

camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

if (room != r_Menu) && (room != r_Ending)
{
	layer_x("Background", x/2);
	layer_y("Background", y-180);
}

if (layer_exists(mountainlayer))
{
	layer_x(mountainlayer,x/2.5);
}

if (layer_exists(treelayer))
{
	layer_x(treelayer,x/4);
}

if (layer_exists(cloudlayer))
{
	layer_x(cloudlayer,x/2);
}
//====================================================================================
