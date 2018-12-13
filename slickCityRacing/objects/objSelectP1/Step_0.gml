if (keyboard_check_pressed(ord("D"))){
	image_index += 1
}

if (keyboard_check_pressed(ord("A"))){
	image_index -= 1
}

if (keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("S"))){
	image_index += 3
}

if (keyboard_check_pressed(vk_enter)){
	global.player1 = image_index;
	global.p1Locked = true;
}