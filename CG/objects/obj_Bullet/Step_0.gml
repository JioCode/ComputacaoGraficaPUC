//mover
	xspd = lengthdir_x( spd, dir );
	yspd = lengthdir_y( spd, dir );

	x += xspd;
	y += yspd;
	
	
//limpeza
	//destroy
	if destroy == true{ instance_destroy(); }
	
	//colisao
	if place_meeting( x, y, obj_SolidWall ){ destroy = true; }
	
	//bala fora da range
	if point_distance( xstart, ystart, x, y ) > maxDist { destroy = true; }
	
	
