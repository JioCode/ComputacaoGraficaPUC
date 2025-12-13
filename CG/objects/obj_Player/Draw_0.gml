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


	