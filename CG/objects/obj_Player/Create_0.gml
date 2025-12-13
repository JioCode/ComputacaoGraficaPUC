//Iniciando variaveis de movimento
moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;


//Controlar Sprite
centerYOffset = -20;
centerY = y + centerYOffset;//feito no evento de etapa

weaponOffsetDist = 8;
aimDir = 0;


face = 3;
sprite[0] = spr_PlayerRight;
sprite[1] = spr_PlayerUp;
sprite[2] = spr_PlayerLeft;
sprite[3] = spr_PlayerDown;

//arma
shootTimer = 0;
shootCooldown = 9;
bulletObj = obj_Bullet;