//state machine 
switch (state)
{
	//chase case 
		case 0:
			//get player's direction
			if instance_exists(obj_Player)
			{
				dir = point_direction(x, y, obj_Player.x, obj_Player.y)
			}
			
			spd = chasespd;
			//transição para o estado de disparo 
			shootTimer++;
			
			if shootTimer > cooldownTime 
			{
				//vai para o estado de disparo
				state = 1;
				
				//zera o cronnometro 
				shootTimer = 0;
			}
	
		break;
	
	//pause and shoot case 
	case 1:
				//get player's direction
			if instance_exists(obj_Player)
			{
				dir = point_direction(x, y, obj_Player.x, obj_Player.y)
			}
			
			spd = 0;
			
			image_index = 0;
			
			//shoot a bullet 
				shootTimer++;
				//create the bullet
				if shootTimer == 1
				{
					var _distancia = 15; // Distância da "ponta da arma"
					var _spawnX = x + lengthdir_x(_distancia, dir);
					var _spawnY = y + lengthdir_y(_distancia, dir);

					// Cria a bala na posição calculada (_spawnX, _spawnY)
					bulletInst = instance_create_depth(_spawnX, _spawnY, depth, obj_EnemyBullet);
    
					bulletInst.dir = dir;
					bulletInst.creator = id;
				}
				//atira uma bala dps q o tempo acaba
				if shootTimer == windupTime && instance_exists(bulletInst)
				{
					bulletInst.state =1;
				}
				//recuperar e voltar a perceguir o jogador 
				if shootTimer > windupTime + recoverTime
				{
					state = 0;
					
					//reseta o timer para usa-lo novamente 
					shootTimer =0;
				}
	break;
}


//receive DMG
if place_meeting( x, y, obj_Damage){
	var _inst = instance_place( x, y, obj_Damage);
	// Se a bala tem um criador E o criador sou eu (id), não faça nada!
    if (_inst.object_index == obj_EnemyBullet) 
	{
        // É minha própria bala, sai fora desse bloco de código
        exit; 
    }
	hp -= _inst.damage;
	
	_inst.destroy = true;
}

if hp <= 0{
	instance_destroy();	
}


//getting the speeds
	xspd = lengthdir_x( spd, dir );
	yspd = lengthdir_y( spd, dir );

//moving
	//collisions
	if place_meeting( x + xspd, y, obj_Wall ){
		xspd = 0;
	}
	if place_meeting( x, y + yspd, obj_Wall ){
		yspd = 0;
	}

	x += xspd;
	y += yspd;
	
	//set the depthj
	
	depth =-y;