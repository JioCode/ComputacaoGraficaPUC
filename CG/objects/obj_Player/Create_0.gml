 //Iniciando variaveis de movimento
	moveDir = 0;
	moveSpd = 5;
	xspd = 0;
	yspd = 0;
	hp = 6 
	invencivelTimer = 0; // Se maior que 0, o player não toma dano

//Controlar Sprite
	centerYOffset = -20;
	centerY = y + centerYOffset;//setado no evento de etapa

	weaponOffsetDist = 8;
	aimDir = 0;


	face = 3;
	sprite[0] = spr_PlayerRight;
	sprite[1] = spr_PlayerUp;
	sprite[2] = spr_PlayerLeft;
	sprite[3] = spr_PlayerDown;

//informacoes da arma
	shootTimer = 0;
	shootCooldown = 9;
	
	bulletObj = obj_Bullet;
	weaponLength = sprite_get_bbox_right( spr_rod ) - sprite_get_xoffset( spr_rod );
	