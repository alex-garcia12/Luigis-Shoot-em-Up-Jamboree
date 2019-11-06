/// @description Equip Gun
global.hasgun = true;
instance_create_layer(obj_Player.x,obj_Player.y,"Gun",obj_Gun);
instance_destroy();

/*
-Once the player collides with the gun pickup, then set hasgun to true.

-Player collides with the gun so we create the instance layer of a obj_Gun, rather
than obj_GunPickup. After that we destroy the GunPickup instance
*/