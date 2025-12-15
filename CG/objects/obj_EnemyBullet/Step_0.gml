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
		depth = -y - 50;
								

	
	break;
	
	//shoot / travel
	case 1:
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;

		//updated depth
		depth = -y;
		
		//shoot a bullet
		
		
	break; 
	
}

//clean up
	//out of room bounds
	if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height
	{
		destroy = true;
	}
	//player colision
	if hitConfirm == true && playerDestroy == true {destroy = true;};
	//actually destroy self
	if destroy == true {instance_destroy();};
	//wall collision
	if place_meeting(x,y, obj_SolidWall) {destroy = true;};