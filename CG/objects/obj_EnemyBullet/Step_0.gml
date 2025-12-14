//state machine
switch(state)
{
	//wait for enemy shoot 
	case 0:
		//aim for the player 
		if instance_exists(obj_Player)
		{
			dir = point_direction(x, y, obj_Player.x, obj_Player.centerY)
		}
		
		//set depth to make myself visible
		depth = -y;
					state = 1;
	
	break;
	
	//shoot / travel
	case 1:
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;

		//updated depth
		depth = -y;
	break; 
	
}