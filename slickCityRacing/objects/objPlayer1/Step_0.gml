//inputs
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);

//active variables
movement = up - down;
turning = left - right;
direction = image_angle + 90;
global.player1Speed = speed * 9;

//turning
if (speed != 0){
	if (turning == 1){
		image_angle += (speed / 5);
	}
	else if (turning == -1){
		image_angle -= (speed / 5);
	}
}

//forward and backward movement
if (movement == 1){
	speed += acceleration - frict;
}
else if (movement == -1){
	speed -= backAccel - frict;
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
	frict = .55;
}

if (speed <= -10){
	frict = .55;
}

if (speed < topSpeed) and (speed > -10){
	frict = .075;
}

//collision
if (place_meeting(x + hspeed, y, objVertWall)) or (place_meeting(x + hspeed, y, objHorWall))
or (place_meeting(x + hspeed, y, objInsideCorner)) or (place_meeting(x + hspeed, y, objOutsideCornerNE))
or (place_meeting(x + hspeed, y, objOutsideCornerNW)) or (place_meeting(x + hspeed, y, objOutsideCornerSE))
or (place_meeting(x + hspeed, y, objOutsideCornerSW)){
	hspeed = hspeed / 2;
	if (hspeed < 0){
		x += bounceDistance
		if (vspeed < 0){
			image_angle -= bounceAngle
		}
		else if (vspeed > 0){
			image_angle += bounceAngle
		}
	}
	else if (hspeed > 0){
		x -= bounceDistance
		if (vspeed < 0){
			image_angle += bounceAngle
		}
		else if (vspeed > 0){
			image_angle -= bounceAngle
		}
	}
}

if (place_meeting(x, y + vspeed, objVertWall)) or (place_meeting(x, y + vspeed, objHorWall))
or (place_meeting(x, y + vspeed, objInsideCorner)) or (place_meeting(x, y + vspeed, objOutsideCornerNE))
or (place_meeting(x, y + vspeed, objOutsideCornerNW)) or (place_meeting(x, y + vspeed, objOutsideCornerSE))
or (place_meeting(x, y + vspeed, objOutsideCornerSW)){
	vspeed = vspeed / 2;
	if (vspeed < 0){
		y += bounceDistance
		if (hspeed < 0){
			image_angle += bounceAngle
		}
		else if (hspeed > 0){
			image_angle -= bounceAngle
		}
	}
	else if (vspeed > 0){
		y -= bounceDistance
		if (hspeed < 0){
			image_angle -= bounceAngle
		}
		else if (hspeed > 0){
			image_angle += bounceAngle
		}
	}
}