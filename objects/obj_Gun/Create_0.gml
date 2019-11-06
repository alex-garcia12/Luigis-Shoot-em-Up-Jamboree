firingdelay = 0;
recoil = 0;
controllerangle = 0;

if (global.hasgun == false) instance_destroy();

/*
-The firingdelay starts at 0 so when we first have the gun it can fire
immediately.

-Same goes for recoil

-Check if the player actually picked up the gun in the first place. If not,
then destroy the gun instance.
*/