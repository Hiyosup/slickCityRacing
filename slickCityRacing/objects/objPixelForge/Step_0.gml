openTimer += 1;

if (image_alpha >= 1){
	image_alpha = 1;
}

if (image_alpha <= 0){
	image_alpha = 0;
}

if (openTimer >= 0) and (openTimer < 120){
	image_alpha += .01;
}

if (openTimer >= 120){
	image_alpha -= .01;
}

if (openTimer >= 240) or keyboard_check_pressed(vk_anykey){
	instance_create_layer(0, 0,"Instances", objMenu);
	instance_create_layer(0, 0, "Text", objMenuText);
	instance_destroy();
}

if (image_index == 0){
	animationIteration += 1;
}

if (animationIteration == 2){
	image_speed = 0;
	image_index = 0 -1;
}