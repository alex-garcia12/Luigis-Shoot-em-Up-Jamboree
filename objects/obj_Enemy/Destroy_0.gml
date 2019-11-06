/// @description Tick down a spawner if one exists

if (instance_exists(obj_Spawner))
{
	with (obj_Spawner)
	{
		if (triggered)
		{
			remaining[current_wave]--;
		}
	}
}