// Inherit the parent event
event_inherited();
creator = noone; // Variável para guardar o ID de quem atirou
dir = 0;
spd = 2;
xspd = 0;
yspd = 0;

//state control 
state = 0; 
//0 = not moving, ain for the player and wait for the enemy too shoot 
//1 = shoot towards the player 

//maxDist = 1000;
destroy = false;
playerDestroy = true; 
hitConfirm = false;