with (all){
	if (image_alpha < 1){
		image_alpha += .01
	}
	
	if (image_alpha >= 1){
		image_alpha = 1
	}
}