//inputs
rightKey = keyboard_check( ord( "D" ) );
leftKey = keyboard_check( ord( "A" ) );
upKey = keyboard_check( ord( "W" ) );
downKey = keyboard_check( ord( "S" ) );

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

//mira do player
	centerY = y + centerYOffset;
	//mira
	aimDir = point_direction( x, centerY, mouse_x, mouse_y );


//Sprites
#region
	//Direcao que o player esta olhando
	face = round( aimDir/90 );
	if face == 4 { face = 0; };

	//Settar o sprite
	
	sprite_index = sprite[face];
	
#endregion