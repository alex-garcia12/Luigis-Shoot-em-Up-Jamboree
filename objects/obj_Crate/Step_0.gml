/// @description Insert description here
// You can write your code in this editor
//vsp = vsp + grv;
//y += vsp;

//with (mywall)
//{
//	image_xscale = other.sprite_width / sprite_width;
//	image_yscale = other.sprite_height / sprite_height;
	
//	if (place_meeting(x,y+other.vsp,obj_SpecialWall))
//	{
//	while(!place_meeting(x,y+sign(other.vsp),obj_SpecialWall))
//	{
//		y += sign(other.vsp);
//	}
//	other.vsp = 0;
//	}
	
//	y += other.vsp;
	
//	if (place_meeting(x,y+other.vsp,obj_Wall))
//	{
//	while(!place_meeting(x,y+sign(other.vsp),obj_Wall))
//	{
//		y += sign(other.vsp);
//	}
//	other.vsp = 0;
//	}
	
//	y += other.vsp;
	
//}

//with (myspecialwall)
//{
//	image_xscale = other.sprite_width / sprite_width;
//	image_yscale = other.sprite_height / sprite_height;
	
//	if (place_meeting(x,y+other.vsp,obj_SpecialWall))
//{
//	while(!place_meeting(x,y+sign(other.vsp),obj_SpecialWall))
//	{
//		y += sign(other.vsp);
//	}
//	other.vsp = 0;
//}
	
//	y += other.vsp;
//}

////Horizontal Collision
//if (place_meeting(x+hsp,y,obj_Wall)) || (place_meeting(x+hsp,y,obj_Crate))
//{
//	while(!place_meeting(x+sign(hsp),y,obj_Wall)) || (!place_meeting(x+sign(hsp),y,obj_Crate))
//	{
//		x += sign(hsp);
//	}
//	hsp = 0;
//}
//x += hsp;

//==============================================================//
//Vertical Collision
//if (place_meeting(x,y+vsp,obj_SpecialWall))
//{
//	while(!place_meeting(x,y+sign(vsp),obj_SpecialWall))
//	{
//		y += sign(vsp);
//	}
//	vsp = 0;
//}
//y += vsp;