var _camX = camera_get_view_x(view_camera [0]);
var _camW = camera_get_view_width(view_camera [0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera [0]);

//retangulo preto 
draw_set_alpha(alpha*alphaMax);
draw_rectangle_colour(_camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false);

//desenhar o texto[
	//"fim de jogo"
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha);
	draw_set_font(Font1);
	
	var _gameOverOffSet = -32;
	draw_text_transformed(_camX + _camW/2, _camY + _camH/2 + _gameOverOffSet, "Você ganhou!",3,3,0);
	
	//atire para reiniciar 
	var _restartOffSet = 60;
	draw_text_transformed(_camX + _camW/2, _camY + _camH/2 + _restartOffSet, "-Atire para Voltar-",1,1,0);
	
	//resetando fontes
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(Font2);
	draw_set_alpha(1);
	
	
