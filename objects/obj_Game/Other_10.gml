/// @description Toggle Pause

if !paused {
	paused = true;					//If we're not paused, then pause.
	if (sprite_exists(pause_sprite)) sprite_delete(pause_sprite);
	pause_sprite = sprite_create_from_surface(application_surface, 0, 0, RES_W, RES_H, false, false, 0, 0);
	instance_deactivate_all(true);	
}
else
{
	paused = false;					//Else unpause
	instance_activate_all();
}


/*
-First 'if' statement checks if we're currently not paused. If we're not 
paused then pause the game.

-

-instance_deactivate_all() deactivates all objects (so it'll stop them from
doing anything else). The argument inside is 'notme' which is set to true. 
In this case, 'me' is referring to the object we're in, which is the game object.
*/