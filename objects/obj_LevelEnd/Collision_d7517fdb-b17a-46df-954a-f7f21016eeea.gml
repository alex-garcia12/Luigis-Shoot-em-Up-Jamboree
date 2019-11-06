/// @description Move to Next Room

with (obj_Player){
	if (hascontrol){
		hascontrol = false;
		SlideTransition(TRANS_MODE.GOTO,other.target);
		audio_play_sound(sn_Transition,4,false);
	}
}
