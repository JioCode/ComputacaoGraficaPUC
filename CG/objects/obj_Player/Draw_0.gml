//desenhar arma atras do player
	if aimDir >= 0 && aimDir < 180{
		draw_my_weapon();
	}



//desenhar player
	draw_self();

//desenhar arma 
	if aimDir >= 180 && aimDir < 360{
		draw_my_weapon();
	}

//desenhar a vida
draw_text(x,y, string(hp));
//balas inimigas no mapa
//draw_text(x,y + 20 , string(instance_number(obj_EnemyBullet)));

	