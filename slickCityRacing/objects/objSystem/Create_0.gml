//Speedometer
global.player1Speed = 0

//Vehicle select
global.player1 = 0

//Game font
draw_set_font(fntPrimary)

//GUI
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);

global.P1Chck = false
global.P1Chck1 = false
global.P1Chck2 = false
global.P1lap = 0;