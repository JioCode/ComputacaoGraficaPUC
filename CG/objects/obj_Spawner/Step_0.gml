timer++

if instance_number(obj_Enemy) >= global.activeEnemyMax || global.totalEnemiesSpawned >= global.enemyRoomMax
{
	timer = 0;
}

if timer >= spawnTime && !place_meeting(x, y+16,obj_Enemy )
{
	var _inst = instance_create_depth( x, y, depth-1, obj_Enemy);
	with(_inst)
	{
		image_alpha = 0;
		state = -1;
	}
	timer = 0;
}                  