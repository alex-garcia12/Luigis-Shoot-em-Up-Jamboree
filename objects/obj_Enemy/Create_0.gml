/// @description 

if (hasweapon)
{
	mygun = instance_create_layer(x,y,"Gun",obj_EGun);
	with(mygun)
	{
		owner = other.id;
	}
}
else mygun = noone;


/*
-Here we're checking if the enemy has a weapon. If so, create an instance of obj_EGun
on the enemy's x,y position on the Gun layer.

-The 'with' sets that particular ID of that particular gun of that particular enemy
to owner. Essentially, each enemy is the owner of their gun and each one has a unique
ID that we set to each owner.

-If the enemy does not have a weapon, then set mygun to noone. noone is a reserved
GM variable. We're just using it to not have a variable error should an enemy not
have a weapon.
*/