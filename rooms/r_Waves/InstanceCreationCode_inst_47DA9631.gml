//[wave,type,spawnpoint,delay]

waves = ds_list_create();

//Add to the list. Add the number of waves. In the array, we specify what wave it is,
//then what type (enemy), spawnpoint (defined down below), and the delay (first
//enemy spawn will be immediate.
ds_list_add(waves,[0,obj_Enemy,0,0]);	 
ds_list_add(waves,[0,obj_Enemy,0,50]);	 
ds_list_add(waves,[0,obj_Enemy,0,100]);	  
ds_list_add(waves,[0,obj_Enemy,1,0]);	 
ds_list_add(waves,[0,obj_Enemy,1,50]);	 
ds_list_add(waves,[0,obj_Enemy,1,100]);	

ds_list_add(waves,[1,obj_Enemy,0,10]);	 
ds_list_add(waves,[1,obj_Enemy,0,20]);
ds_list_add(waves,[1,obj_Enemy,0,30]);
ds_list_add(waves,[1,obj_Enemy,0,40]);
ds_list_add(waves,[1,obj_Enemy,0,50]);
ds_list_add(waves,[1,obj_Enemy,0,60]);

ds_list_add(waves,[2,obj_Enemy,1,10]);	 
ds_list_add(waves,[2,obj_Enemy,1,20]);
ds_list_add(waves,[2,obj_Enemy,1,30]);
ds_list_add(waves,[2,obj_Enemy,1,40]);
ds_list_add(waves,[2,obj_Enemy,1,50]);
ds_list_add(waves,[2,obj_Enemy,1,60]);

ds_list_add(waves,[3,obj_EnemyBig,0,0]);	

spawn[0,0] = 640;		//x coordinate of first spawnpoint
spawn[0,1] = 285;		//y coordinate of first spawnpoint
spawn[1,0] = 1342;		//x coordinate of second spawnpoint
spawn[1,1] = 285;		//y coordinate of second spawnpoint