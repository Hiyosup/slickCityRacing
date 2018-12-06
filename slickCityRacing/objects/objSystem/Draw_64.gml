switch (room){
	case (rmTrack1):
		draw_set_halign(fa_left);
		draw_text_color(vx, vy + 694, "Speed: " + string(global.player1Speed), $FF99FF, $FF99FF, $FF99FF, $FF99FF, 1)
		draw_text(vx, vy + 662, "Lap: " + string(global.P1lap));
		
		//starting the race
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		if (global.raceStarting < .33){
			draw_text_transformed_color(vx+512, vy+384, "3", 6, 6, 0, $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1)
		}
		if (global.raceStarting < .66) and (global.raceStarting >= .33){
			draw_text_transformed_color(vx+512, vy+384, "2", 6, 6, 0, $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1)
		}
		if (global.raceStarting < .99)  and (global.raceStarting >= .66){
			draw_text_transformed_color(vx+512, vy+384, "1", 6, 6, 0, $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1)
		}
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		//timer function
		if (global.timeCount == true) and (global.P1lap < global.maxLaps){
			global.second += 1/room_speed;
		}
		if (global.second >= 60){
			global.second = 0;
			global.minute += 1;
		}
		if (global.minute >= 60){
			global.minute = 0;
			global.hour += 1;
		}
		//timer display
		if (global.hour < 10){
			if (global.minute < 10){
				if (global.second < 10){
					draw_text_color(vx, vy + 728, "Timer " + "0" + string(global.hour) + ":0" + string(global.minute) + ":0" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
				else {
					draw_text_color(vx, vy + 728, "Timer " + "0" + string(global.hour) + ":0" + string(global.minute) + ":" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
			}
			else {
				if (global.second < 10){
					draw_text_color(vx, vy + 728, "Timer " + "0" + string(global.hour) + ":" + string(global.minute) + ":0" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
				else {
					draw_text_color(vx, vy + 728, "Timer " + "0" + string(global.hour) + ":" + string(global.minute) + ":" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
			}
		}
		else {
			if (global.minute < 10){
				if (global.second < 10){
					draw_text_color(vx, vy + 728, "Timer " + string(global.hour) + ":0" + string(global.minute) + ":0" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
				else {
					draw_text_color(vx, vy + 728, "Timer " + string(global.hour) + ":0" + string(global.minute) + ":" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
			}
			else {
				if (global.second < 10){
					draw_text_color(vx, vy + 728, "Timer " + string(global.hour) + ":" + string(global.minute) + ":0" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
				else {
					draw_text_color(vx, vy + 728, "Timer " + string(global.hour) + ":" + string(global.minute) + ":" + string(global.second), c_lime, c_lime, c_lime, c_lime, 1);
				}
			}
		}
		break;
}

if (!instance_exists(objMenuText)) and (instance_exists(objMenu)) and (!instance_exists(objVehicleSelect)){
	if (optionInitialize < 1){
		optionSelect = 0;
		optionInitialize += .1;
	}
	draw_set_halign(fa_center);
	if (keyboard_check_pressed(vk_down)){
		optionSelect += 1
	}
	if (keyboard_check_pressed(vk_up)){
		optionSelect -= 1
	}
	if (creditsOn == false){
		if (optionSelect = 0){
			draw_text_color(room_width/2, room_height/2 -64, "Sound: " + soundOn, $FF66CC, $FF66CC, $FF66CC, $FF66CC, 1);
		}
		else {
			draw_text_color(room_width/2, room_height/2 -64, "Sound: " + soundOn, $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1);	
		}
		if (optionSelect = 1){
			draw_text_color(room_width/2, room_height/2, "Credits", $FF66CC, $FF66CC, $FF66CC, $FF66CC, 1);
		}
		else {
			draw_text_color(room_width/2, room_height/2, "Credits", $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1);
		}
		if (optionSelect = 2){
			draw_text_color(room_width/2, room_height/2 +64, "Back to menu", $FF66CC, $FF66CC, $FF66CC, $FF66CC, 1);
		}
		else {
			draw_text_color(room_width/2, room_height/2 +64, "Back to menu", $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1);
		}
	
		if (keyboard_check_pressed(vk_enter)) and (optionSelect == 0) and (optionInitialize >= 1){
			if (soundOn == "No"){
				soundOn = "Yes";
			}
			else if (soundOn == "Yes"){
				soundOn = "No";
			}
		}
	
		if (keyboard_check_pressed(vk_enter)) and (optionSelect == 1){
			creditsOn = true;
			optionInitialize = 0;
		}
	
		if (keyboard_check_pressed(vk_enter)) and (optionSelect == 2){
			optionInitialize = 0;
			instance_create_layer(0, 0, "Text", objMenuText);
		}
	}
	
	if (creditsOn == true){
		draw_text_color(room_width/2, room_height/2-64, "Programmed by: Kale McSpadden and Kevin Molina", $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1);
		draw_text_color(room_width/2, room_height/2, "Art and Animations by: Kale McSpadden", $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1);
		draw_text_color(room_width/2, room_height/2+64, "Music and Sound by: Kevin Molina", $00CCCC, $00CCCC, $00CCCC, $00CCCC, 1);
		if (keyboard_check_pressed(vk_anykey)) and (optionInitialize >= 1){
			creditsOn = false;
			optionInitialize = 0;
		}
	}
}