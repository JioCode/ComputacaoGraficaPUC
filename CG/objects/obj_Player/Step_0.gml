//inputs
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;


//dano no jogador
// 1. Detectar colisão com a bala do inimigo e o inimigo
var _balaInimiga = instance_place(x, y, obj_EnemyBullet);
var _inimigo = instance_place(x, y, obj_Enemy);
if (invencivelTimer <= 0)
{
    //Tocou no Inimigo
    if (_inimigo != noone)
    {
        hp -= 1;          
        invencivelTimer = 60;
        
        // Empurra o player um pouco para trás para desgrudar do inimigo
        var _empurraoDir = point_direction(_inimigo.x, _inimigo.y, x, y);
        x += lengthdir_x(40, _empurraoDir);
        y += lengthdir_y(-40, _empurraoDir);
    }
}

if (_balaInimiga != noone && invencivelTimer <= 0)
{
    hp -= 1; 
    invencivelTimer = 60;
    
    instance_destroy(_balaInimiga);
}

//Controla o tempo de invencibilidade
if (invencivelTimer > 0)
{
    invencivelTimer--;
    
    // Efeito visual enquanto estiver invencível
    if (invencivelTimer % 10 < 5) 
    {
        image_alpha = 0.5; 
    }
    else 
    {
        image_alpha = 1; 
    }
}
else
{
    image_alpha = 1; 
}

// 3. Checar Morte (Game Over)
if (hp <= 0)
{
	//cria o obj de fim de jogo
	if (!instance_exists(obj_GameOverScreem))
	{
		instance_create_depth(0,0,-10000, obj_GameOverScreem)
	}
	instance_destroy();
}

//movimentacao player
#region
	//pegar direcao do movimento
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction( 0, 0, _horizKey, _vertKey );
	
	//pegar velocidades de x e y
	var _spd = 0;
	var _inputLevel = point_distance( 0, 0, _horizKey, _vertKey );
	_inputLevel = clamp( _inputLevel, 0, 1 );
	_spd = moveSpd * _inputLevel;
	
	xspd = lengthdir_x( _spd, moveDir );
	yspd = lengthdir_y( _spd, moveDir );
	
	//colisoes
	if place_meeting( x + xspd, y, obj_Wall ){
		xspd = 0;
	}
	if place_meeting( x, y + yspd, obj_Wall ){
		yspd = 0;
	}
	//move o player
	x += xspd;
	y += yspd;
	
	//profundidade
	depth = -bbox_bottom;
	
#endregion

//Sprites
#region
//mira do player
	centerY = y + centerYOffset;
	//mira
	aimDir = point_direction( x, centerY, mouse_x, mouse_y );


		//Direcao que o player esta olhando
		face = round( aimDir/90 );
		if face == 4 { face = 0; };

		//Settar o sprite
	
		sprite_index = sprite[face];
	
#endregion


//Atirar a arma
#region
if shootTimer > 0 { shootTimer--; }

if shootKey && shootTimer <=0
{
		//resetar timer
		shootTimer = shootCooldown;
		
		//criando a bala (obj_Bullet)
		var _xOffset = lengthdir_x( weaponLength + weaponOffsetDist, aimDir );
		var _yOffset = lengthdir_y( weaponLength + weaponOffsetDist, aimDir );
		var _bulletInst = instance_create_depth( x + _xOffset, centerY + _yOffset, depth-100, bulletObj );
		
		//mudar a direçao da bala
		with( _bulletInst )
		{
			dir = other.aimDir;
		}
		
}
#endregion