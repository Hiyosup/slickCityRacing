//inputs
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);

//active variables
movement = up - down;
turning = left - right;
direction = image_angle + 90;

//turning
if (speed != 0){
	if (turning == 1){
		image_angle += (speed / 4);
	}
	else if (turning == -1){
		image_angle -= (speed / 4);
	}
}

//forward and backward movement
if (movement == 1){
	speed += acceleration;
}
else if (movement == -1){
	speed -= backAccel;
}
else {
	if (speed > 1){
		speed -= frict
	}
	else if (speed > 0){
		speed = 0
	}
	
	if (speed < -1){
		speed += frict
	}
	else if (speed < 0){
		speed = 0
	}
}

//speed control
if (speed >= topSpeed){
	speed = topSpeed;
}

if (speed <= -10){
	speed = -10;
}

//collision
if (place_meeting(x + hspeed, y, objVertWall)) or (place_meeting(x + hspeed, y, objHorWall))
or (place_meeting(x + hspeed, y, objInsideCorner)) or (place_meeting(x + hspeed, y, objOutsideCornerNE))
or (place_meeting(x + hspeed, y, objOutsideCornerNW)) or (place_meeting(x + hspeed, y, objOutsideCornerSE))
or (place_meeting(x + hspeed, y, objOutsideCornerSW)){
	hspeed = hspeed / 2;
	if (hspeed < 0){
		x += 8
		if (vspeed < 0){
			image_angle -= 20
		}
		else if (vspeed > 0){
			image_angle += 20
		}
	}
	else if (hspeed > 0){
		x -= 8
		if (vspeed < 0){
			image_angle += 20
		}
		else if (vspeed > 0){
			image_angle -= 20
		}
	}
}

if (place_meeting(x, y + vspeed, objVertWall)) or (place_meeting(x, y + vspeed, objHorWall))
or (place_meeting(x, y + vspeed, objInsideCorner)) or (place_meeting(x, y + vspeed, objOutsideCornerNE))
or (place_meeting(x, y + vspeed, objOutsideCornerNW)) or (place_meeting(x, y + vspeed, objOutsideCornerSE))
or (place_meeting(x, y + vspeed, objOutsideCornerSW)){
	vspeed = vspeed / 2;
	if (vspeed < 0){
		y += 8
		if (hspeed < 0){
			image_angle += 20
		}
		else if (hspeed > 0){
			image_angle -= 20
		}
	}
	else if (vspeed > 0){
		y -= 8
		if (hspeed < 0){
			image_angle -= 20
		}
		else if (hspeed > 0){
			image_angle += 20
		}
	}
}