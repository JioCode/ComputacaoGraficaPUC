//obter a largura e a altura da camera 
var _camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height( view_camera[0] );

//centro do jogador
if instance_exists(obj_Player)
{
	x = obj_Player. x - _camW/2;
	y = obj_Player. centerY - camH/2;
}
//fixar camera nas bordas 
x = clamp(x, 0, room_width - _camW);
y = clamp(y, 0, room_height - camH);

//set the camera position
camera_set_view_pos( view_camera[0], x, y );