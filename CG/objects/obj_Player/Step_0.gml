//inputs
rightKey = keyboard_check( vk_right );
leftKey = keyboard_check( vk_left );
upKey = keyboard_check( vk_up );
downKey = keyboard_check( vk_down );

//movimentacao player
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