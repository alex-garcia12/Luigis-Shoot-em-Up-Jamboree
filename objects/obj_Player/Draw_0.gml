/// @description 

if (state == pState.swing) draw_line_width(grappleX,grappleY,ropeX,ropeY,2);
//draw_self();

var interval = 16;								//Interval at which player sprite blinks upon taking damage
if (alarm[1] % interval) <= (interval / 2)		//Essentially check if we got hit (not entirely sure how alarms work)
{
	gpu_set_fog(false, c_red, 0, 1);			//Don't make the sprite red
}
else
{
	gpu_set_fog(true, c_red, 0, 1);				//Make the player sprite red. We switch betweem true and false to get the alternating effect
}

draw_self();									//Draw the sprite normally
gpu_set_fog(false, c_red, 0, 1);				//Reset the sprite the false so we don't make the whole screen flash red
//if(flash > 0) {
//	flash--;
//	shader_set(sh_White)
//	draw_self();
//	shader_reset()
//}