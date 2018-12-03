//Speedometer
global.player1Speed = 0

//Vehicle select
global.player1 = 0

//Game font
draw_set_font(fntPrimary)

//GUI
vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);

if (room = rmMain){
	instance_create_layer(room_width/2, room_height/2, "Text", objGMS2Splash)
}