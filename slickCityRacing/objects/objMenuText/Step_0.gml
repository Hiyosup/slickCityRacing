if (keyboard_check_pressed(vk_up)){
	image_index -= 1;
}

if (keyboard_check_pressed(vk_down)){
	image_index += 1;
}

if (keyboard_check_pressed(vk_enter)){
	if (image_index == 0){
		instance_create_layer(x,y,"Text",objVehicleSelect)
		instance_destroy();
	}
	if (image_index == 1){
		
	}
	if (image_index == 2){
		game_end();
	}
}