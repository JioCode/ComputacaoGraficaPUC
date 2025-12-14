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
	break;
}


//receive DMG
if place_meeting( x, y, obj_Damage){
	var _inst = instance_place( x, y, obj_Damage);
	
	hp -= _inst.damage;
	
	_inst.destroy = true;
}

if hp <= 0{
	instance_destroy();	
}

//chase
	dir = point_direction( x, y, obj_Player.x, obj_Player.y );

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
//inherit the parent event
	//get damaged and dying
event_inherited()