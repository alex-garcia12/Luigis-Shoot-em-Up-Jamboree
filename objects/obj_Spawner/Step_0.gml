/// @description Spawn Things

if (triggered)
{
	//Check the list for enemies that are ready to spawn and if they are the
	//right wave/time, then spawn them.
	
	for (var i = 0; i < ds_list_size(waves); i++)
	{
		var next = ds_list_find_value(waves, i);
		if (next[_WAVE] == current_wave) && (next[_DELAY] == timer)
		{
			var spawnpoint = next[_SPAWN];
			instance_create_layer(spawn[spawnpoint,0], spawn[spawnpoint,1], "Enemy", next[_TYPE]);
		}
	}
	//Increase Timer
	timer++;
	
	//Next wave or end spawner when all enemies have died
	if (remaining[current_wave] <= 0)
	{
		if (current_wave == total_waves)		//If we've run out of waves in this area (for this trigger)
		{
			with (obj_Door) closed = false;		//Open up the doors
			instance_destroy();					//Destroy the spawner
		}
		else									//If we still have waves to go...
		{
			current_wave++;						//Move to the next wave
			timer = 0;							//Reset the (delay) timer
		}
	}
}

/*
-First we check if our spawner was triggered.

-Next, we're gonna iterate through our LIST of ARRAYS. Each array is essentially
going to hold a sort of 'scenario', in that say we trigger the very first wave in
the game, then that scenario or array in the ds_list will be returned. As a result,
we'll be getting info including the wave number, the type of wave, number of enemies
spawned, and the delay between each enemy spawn.

-The returned value will be placed in our var next variable.

-We then check if: the current enemy (of _WAVE) is part of the 'current_wave'.
We also check if the delay is equal to our 'timer' variable. This should ultimately
give us an enemy that spawns in the right wave at the right time.

-var spawnpoint will give us the coordinates of where we wanna spawn our enemies.
We're gonna define this by just dragging and dropping these spawners inside the
room editor so it'll change depending on those coordinates.

-Once we define our spawnpoint, we wanna actually create the enemies at the spawnpoint.
Do this by creating instances of enemies using the instance_create_layer() function.
We set the x coordinate to spawn[spawnpoint,0]. spawn[] is our array that holds all
the 'spawnpoints' in it, for that particular wave. We have the 0 because spawn[] is
a 2D array, so we're looking at the first entry of that array of that wave. Same goes
for the y coordinate only it's the next entry so we put in a 1. We then specify the layer
we wanna create on which is "Enemy", then specify the object we wanna create. In this 
case, it's next[_TYPE], as this will define what we're spawning.

-Next, we check our 'remaining[]' array to see how many enemies remain in the wave. We're
checking if there are 0 or less than 0 enemies left on the current_wave.
*/