switch (room){
	case (rmTrack1):
		draw_set_halign(fa_left);
		draw_text_color(vx, vy + 728, "Speed: " + string(global.player1Speed), $FF99FF, $FF99FF, $FF99FF, $FF99FF, 1)
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