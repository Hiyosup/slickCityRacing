if (keyboard_check_pressed(vk_up)){
	image_index -= 1;
}

if (keyboard_check_pressed(vk_down)){
	image_index += 1;
}

if (keyboard_check_pressed(vk_enter)){
	if (image_index == 0){
		instance_create_layer(x, y,"Text",objVehicleSelect);
		instance_create_layer(x, y, "HText", objSelectP1);
		instance_create_layer(x, y, "HText", objSelectP2);
		instance_destroy();
	}
	if (image_index == 1){
		instance_destroy();
	}
	if (image_index == 2){
		game_end();
	}
}

openTimer += 1;

if (image_alpha >= 1){
	image_alpha = 1
}

if (image_alpha <= 0){
	image_alpha = 0
}

if (openTimer >= 0) and (openTimer < 120){
	image_alpha += .01
}