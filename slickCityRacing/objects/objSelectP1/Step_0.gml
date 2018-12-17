if (keyboard_check_pressed(ord("D"))){
	image_index += 1
}

if (keyboard_check_pressed(ord("A"))){
	image_index -= 1
}

if (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("S"))){
	image_index += 3
}

if (global.playerNumber == 0){
	if (keyboard_check_pressed(vk_right)){
		image_index += 1
	}

	if (keyboard_check_pressed(vk_left)){
		image_index -= 1
	}

	if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)){
		image_index += 3
	}
}

if (keyboard_check_pressed(vk_enter)){
	global.player1 = image_index;
	global.p1Locked = true;
}