with (all){
	if (image_alpha < 1){
		image_alpha += .005
	}
	
	if (image_alpha >= 1){
		image_alpha = 1
	}
}

global.raceStarting = image_alpha;

if (image_alpha == 1){
	global.timeCount = true;
}