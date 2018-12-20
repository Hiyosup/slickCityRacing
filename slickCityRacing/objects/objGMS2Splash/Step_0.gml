if (recordOn == true){
	if (keyboard_check_pressed(vk_space)){
		recordOn = false
	}
}

if (recordOn == false){
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

	if (openTimer >= 120){
		image_alpha -= .01
	}

	if (openTimer >= 240) or keyboard_check_pressed(vk_anykey){
		if (openTimer >= 15){
			instance_create_layer(room_width/2, room_height/2,"Text", objSAESplash);
			instance_destroy();
		}
	}
}