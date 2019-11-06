/// @description Setup Camera

/*
-cam is given the value of the viewport we enabled in the room and viewport settings
in the room editor. In other words, it is given the camera that is created by default
by GameMaker for the viewport.

-follow is a variable that will be set to different objects depending on the circumstance.
More often than not we'll have it on the player, but maybe we'll have it on an enemy, 
for a cutscene, etc. Typically speaking, you wanna only set up the follow variable 
like the way we have it if we only have one instance. We do in this case, just one 
player. If it was an enemy or maybe a second player, we may have to adjust it.

-We're declaring view_w_half and giving it the value of half the camera, aka the cam,
aka the viewport. This is mainly so we can better center it around the player. Same goes
for the height.

-xTo and yTo represent the x,y coordinates we're moving towards at any point in time.
They're gonna get constantly updated to our player x,y position. xstart and ystart will 
be where the original destination for the camera will be wherever the camera starts.

-shake_length determines how long the camera will shake for. We set it to 60 which means
60fps, so it'll shake for the duration of one second

-shake_magnitude determines how 'strong' the shake is. It basically defines a 'radius'
of pixels we're allowed to move in. 6 pixels to the left, right, etc.

-shake_remain is just a counter for shake_magnitude. It'll decrement over time so
we know how much 'shake' we have left and when to stop shaking. When a new shake
is triggered, both shake_remain and shake_magnitude are reset to 6.

-buff is just used as a buffer so we don't shake the camera too much and outside
of the game room.
*/


cam = view_camera[0];
follow = obj_Player;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff =32;

mountainlayer = layer_get_id("Mountains");
treelayer = layer_get_id("Trees");
cloudlayer = layer_get_id("Clouds");