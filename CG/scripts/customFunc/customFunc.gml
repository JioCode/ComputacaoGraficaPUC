//desenhar arma do player
function draw_my_weapon()
{
	//desenhar arma
	//Offset da arma
	var _xOffset = lengthdir_x( weaponOffsetDist, aimDir );
	var _yOffset = lengthdir_y( weaponOffsetDist, aimDir );
	
	//arrumar a arma
	var _weaponYsc1 = 1;
	if aimDir > 90 && aimDir < 270{
		_weaponYsc1 = -1;
	}

	draw_sprite_ext( spr_rod, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYsc1, aimDir, c_white, 1 );
}