/// @description Optional Debug Text
//Mark this instance to not 'visible' in order to hide this. Or delete the event.

if (triggered)
{
	var str = "Remaining: ";
	for (var i = 0; i < array_length_1d(remaining); i++)
	{
	str += string(remaining[i]) + "|";
	}
	draw_text(70, 70,
	str 
	+ "\nwaves total: " + string(total_waves)
	+ "\nwave now: " + string(current_wave)
	)
}