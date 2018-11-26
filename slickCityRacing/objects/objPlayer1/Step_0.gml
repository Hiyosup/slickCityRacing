//Input for  game
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

//Check if we are moving
xaxis = right - left;
yaxis = down - up;

moving = (yaxis != 0);

if(moving){// if we are moving
	dir = yaxis;
	
	//Turning
	if(xaxis != 0) {
		if(yaxis == -1) { //moving forward
			if(left){
				image_angle += turnSpd;
			} else if (right){
				image_angle -=turnSpd;
			}
		}
		else if	(yaxis == 1) {	//moving backwards
		if (left){
			image_angle += turnReverseSpd;
		} else if (right) {
			image_angle -= turnReverseSpd;
				}	
			}
		}
	}
	// Movement
	if(yaxis == -1){//moving foward
		if (len < maxSpd){
			len += accSpd;
		}
		else if (len > maxSpd){
		}
	}
	else if (yaxis == 1 ){//moving backwards
		if(len> -maxReverseSpd){
			len -=accReverseSpd
	}	else if (len <-maxReverseSpd){
		len = -maxReverseSpd;
		}		
	}		
	else {// if we are not moving
		if (dir == -1) {// if moving forward
			if (len > 0) {
				len -= fricSpd;
			}else if (len <= 0) {
				len = 0;
			}
		}
		else if (dir == 1 ){// moving backwards
			if (len < 0){
				len +=fricSpd;
			}
			else if (len >= 0){
				len = 0;
			}
		}
	}	

//Calculate Where to move
hspd = lengthdir_x(len, image_angle+90);
vspd = lengthdir_y(len, image_angle+90);

//Move the car
x += hspd;
y += vspd;

//Horizontal Collitions
if (place_meeting(x, y+sign(hspd), obj_wall)) {
	while(!place_meeting(x,y+sign(hspd), y, obj_wall)){
		x += sign(hspd);
	}
	hspd = 0; 
}	
