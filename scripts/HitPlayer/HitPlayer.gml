direction = point_direction(other.x,other.y,x,y);	//Change x,y to obj_Player if needed
hsp = lengthdir_x(40,direction);
vsp = lengthdir_y(15,direction)-2;

if (sign(hsp) != 0) image_xscale = sign(hsp);