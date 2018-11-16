// movement

left = keyboard_check(vk_left);
right =keyboard_check(vk_right);
up =keyboard_check(vk_up);
down =keyboard_check(vk_down);

xaxis = right - left;
yaxis = down - up;

moving = (yaxis != 0);

if(moving){
	dir = yaxis;
	
	// Turning
	if (xaxis != 0){
			if (yaxis == -1){ //we moving forward
				if (left){
					image_angle += turnSpd;
				}else if (right){
					image_angle -=turnSpd
				}
