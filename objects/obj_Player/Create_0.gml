hsp = 0;
vsp = 0;
hsp_frac = 0;
vsp_frac = 0;

hsp_acc = 0.5;
hsp_fric_ground = 0.5;
hsp_fric_air = 0.1;
walksp = 4;
hsp_wjump = 7;

vsp_jump = -8;
vsp_max = 10;
vsp_wjump = -9;
vsp_max_wall = 4;

onground = false;
onwall = 0;
dust = 0;

grv = 0.4;
grv_wall = 0.1;
canjump = 0;
maxhsp = 4;

controller = 0;
hascontrol = true;

gunkickx = 0;
gunkicky = 0;

walljumpdelay = 0;
walljumpdelay_max = 17;

global.hp = 75;
hp_max = global.hp;
flash = 0;
invincible = false;
groundpoundtimer = 60;

healthbar_width = 100;
healthbar_height = 12;
healthbar_x = (RES_W / 2) - (healthbar_width/2);
healthbar_y = 10;//(ystart - 100);
//healthbar_offsetX = 0;
//healthbar_offsetY = 50;

state = pState.normal;
enum pState
{
	normal,
	swing,
	roll
}