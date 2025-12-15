var _camX = camera_get_view_x( view_camera[0] );
var camY = camera_get_view_y( view_camera[0] );

var _hpString = "HP:" + string(playerHP) + "/" + string(playerMaxHP);
draw_text( _camX, camY, _hpString); 

var _enemyCountStr = "Inimigos mortos:" + string(global.enemyKillCount) + "/" + string(global.enemyRoomMax)
draw_text( _camX, camY+40, _enemyCountStr); 
