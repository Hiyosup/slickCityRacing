//Exit Game
if (keyboard_check_pressed(vk_escape)){
	game_end();
}
//Fullscreen
if (keyboard_check_pressed(vk_f1)) and (window_get_fullscreen()){
	window_set_fullscreen(false)
}
else if (keyboard_check_pressed(vk_f1)) and (!window_get_fullscreen()){
	window_set_fullscreen(true)
}
//Checkpoint

if (instance_exists(objPlayer1))and(instance_exists(objCheckpoint)){
	with (instance_nearest(objPlayer1.x, objPlayer1.y, objCheckpoint)){
		if (place_meeting(x,y, objPlayer1)){
			global.P1Chck = true;	
		}
}
}
if (instance_exists(objPlayer1))and(instance_exists(obj_Checkpoint1)){
	with (instance_nearest(objPlayer1.x, objPlayer1.y, obj_Checkpoint1)){
		if (place_meeting(x,y, objPlayer1)){
			global.P1Chck1 = true;			
		}			
	}
}
if (instance_exists(objPlayer1))and(instance_exists(obj_Checkpoint2)){
	with (instance_nearest(objPlayer1.x, objPlayer1.y, obj_Checkpoint2)){
		if (place_meeting(x,y, objPlayer1)){
			global.P1Chck2 = true;			
		}
	}
}
with (objPlayer1){
	if(global.P1Chck == true && global.P1Chck1 == true && global.P1Chck2 == true ) and (place_meeting(x, y, objCheckpoint)){
		global.P1lap +=1;
		global.P1Chck = false;
		global.P1Chck1 = false;
		global.P1Chck2 = false;
	}
}