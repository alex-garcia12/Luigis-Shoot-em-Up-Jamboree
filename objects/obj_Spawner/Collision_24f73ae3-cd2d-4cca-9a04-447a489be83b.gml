/// @description Start Waves

if (triggered == false)
{
	//close doors and stop from retriggering
	with (obj_Door) closed = true;
	triggered = true;
	
	//Work out number of waves and enemies per waves
	total_waves = -1;
	for (var i = 0; i < ds_list_size(waves); i++)
	{
		var thisentry = ds_list_find_value(waves, i);
		if (thisentry[_WAVE] > total_waves)				//For every entry in the list, we see if 'thisentry' is greater than total_waves
		{
			total_waves++;								//Increment total_waves (to equal how many waves per trigger)
			remaining[total_waves] = 0;					//Reset the number of enemies to 0 so it can reset every new wave.
		}
		remaining[total_waves]++;						//Keep adding the specified number of enemies to remaining[]
	}
}

//audio_play_sound(sn_Transition,4,false);

