hp = 10;
spd = 0;
chasespd = 1;
dir = 0;
xspd = 0;
yspd = 0;

//state machine 
state = 0;
	//spawn state
	fadeSpd = 1/15;
	emergeSpd = .25;
	
	global.totalEnemiesSpawned++;
	//shooting state
	cooldownTime = 4*60;
	shootTimer = 0;
	windupTime = 60;
	recoverTime = 45;
	bulletInst = noone;