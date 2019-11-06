/// @description Insert description here

repeat(7)
{
	with(instance_create_layer(x,bbox_bottom,"Bullets",obj_Dust))
	{
		image_xscale = choose(3,-3);
		image_yscale = choose(3,-3);
	}
}
with(mywall) instance_destroy();

//with(myspecialwall) instance_destroy();

/*
-Destroys the wall once the crate is destroyed so we can
progress and won't be blocked by an invisible wall.
*/