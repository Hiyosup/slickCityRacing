global.raceStarting = 0;

//Speedometer
global.player1Speed = 0;
global.player2Speed = 0;

//Vehicle select
global.numberSelect = false;
global.playerNumber = 0;
global.player1 = 0;
global.player2 = 0;

//Game font
draw_set_font(fntPrimary)

//GUI
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);
vxw = camera_get_view_width(view_camera[0]);
vyh = camera_get_view_height(view_camera[0]);

if (room = rmMain){
	instance_create_layer(room_width/2, room_height/2, "Text", objPixelForge)
}

optionSelect = 0;
optionInitialize = 0;
creditsOn = false;
soundOn = "Yes";

//laps
global.P1lap = 0;
global.P1Chck = false;
global.P1Chck1 = false;
global.P1Chck2 = false;
global.P2lap = 0;
global.P2Chck = false;
global.P2Chck1 = false;
global.P2Chck2 =false;

global.maxLaps = 1;

//timer
global.hour = 0;
global.minute = 0;
global.second = 0;
global.timeCount = false;

//bike select
global.p1Locked = false;
global.p2Locked = false;

p1Finished = false;
p1Hour = 0;
p1Minute = 0;
p1Second = 0;

p2Finished = false;
p2Hour = 0;
p2Minute = 0;
p2Second = 0;