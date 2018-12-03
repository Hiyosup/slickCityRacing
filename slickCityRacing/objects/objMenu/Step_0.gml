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