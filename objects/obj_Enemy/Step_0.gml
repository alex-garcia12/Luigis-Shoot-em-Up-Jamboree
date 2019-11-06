vsp = vsp + grv;

//Don't Walk off Edges
if (grounded) && (afraidofheights) && (!place_meeting(x+hsp, y+1, obj_Wall))
{
	hsp = -hsp;
}

//==============================================================//
//Horizontal Collision
if (place_meeting(x+hsp,y,obj_Wall)){

	while(!place_meeting(x+sign(hsp),y,obj_Wall)){
		x += sign(hsp);
	}
	hsp = -hsp;
}
x += hsp;

//==============================================================//
//Vertical Collision
if (place_meeting(x,y+vsp,obj_Wall)){

	while(!place_meeting(x,y+sign(vsp),obj_Wall)){
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

//==============================================================//
//Animation
if(!place_meeting(x,y+1,obj_Wall))
{
	grounded = false;
	sprite_index = spr_EnemyA;
	image_speed = 0;
	if(sign(vsp) > 0) image_index = 1; else image_index = 0;
}

else 
{
	grounded = true;
	image_speed = 1;
	if(hsp == 0)
	{
		sprite_index = spr_Enemy;
	}
	else 
	{
		sprite_index = spr_EnemyR;
	}
}

if(hsp != 0) image_xscale = sign(hsp) * size;
image_yscale = size;

//==============================================================//
//Custom Cursor

window_set_cursor(cr_none)
cursor_sprite = spr_CustomCursor;
