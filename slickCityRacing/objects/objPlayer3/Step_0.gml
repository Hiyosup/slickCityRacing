//inputs
up = 0
down = 0

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
		if (vspeed < 0) and (place_meeting(x + hspeed, y, objOutsideCornerNW)){
			image_angle += bounceAngle
		}
		else if (vspeed < 0) and (!place_meeting(x + hspeed, y, objOutsideCornerNW)){
			image_angle -= bounceAngle
		}
		else if (vspeed > 0) and (place_meeting(x + hspeed, y, objOutsideCornerSW)){
			image_angle -= bounceAngle
		}
		else if (vspeed > 0) and (!place_meeting(x + hspeed, y, objOutsideCornerSW)){
			image_angle += bounceAngle
		}
	}
	else if (hspeed > 0){
		x -= bounceDistance
		if (vspeed < 0) and (place_meeting(x + hspeed, y, objOutsideCornerNE)){
			image_angle -= bounceAngle
		}
		else if (vspeed < 0) and (!place_meeting(x + hspeed, y, objOutsideCornerNE)){
			image_angle += bounceAngle
		}
		else if (vspeed > 0) and (place_meeting(x + hspeed, y, objOutsideCornerSE)){
			image_angle += bounceAngle
		}
		else if (vspeed > 0) and (!place_meeting(x + hspeed, y, objOutsideCornerSE)){
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
		if (hspeed < 0) and (place_meeting(x, y + vspeed, objOutsideCornerNW)){
			image_angle -= bounceAngle
		}
		else if (hspeed < 0) and (!place_meeting(x, y + vspeed, objOutsideCornerNW)){
			image_angle += bounceAngle
		}
		else if (hspeed > 0) and (place_meeting(x, y + vspeed, objOutsideCornerNE)){
			image_angle += bounceAngle
		}
		else if (hspeed > 0) and (!place_meeting(x, y + vspeed, objOutsideCornerNE)){
			image_angle -= bounceAngle
		}
	}
	else if (vspeed > 0){
		y -= bounceDistance
		if (hspeed < 0) and (place_meeting(x, y + vspeed, objOutsideCornerSW)){
			image_angle += bounceAngle
		}
		else if (hspeed < 0) and (!place_meeting(x, y + vspeed, objOutsideCornerSW)){
			image_angle -= bounceAngle
		}
		else if (hspeed > 0) and (place_meeting(x, y + vspeed, objOutsideCornerSE)){
			image_angle -= bounceAngle
		}
		else if (hspeed > 0) and (!place_meeting(x, y + vspeed, objOutsideCornerSE)){
			image_angle += bounceAngle
		}
	}
}

if (pointOn1 == false){
	mp_potential_step(obj_Goal.x, obj_Goal.y, 10, false);
	if (place_meeting(x, y, obj_Goal)){
		pointOn1 = true;
	}
	if (x < obj_Goal.x){
		if (abs(x - obj_Goal.x) > abs(y - obj_Goal.y)){
			if (y - obj_Goal <= 0){
				image_angle += 5
			}
			else if (y - obj_Goal >= 0){
				image_angle -= 5
			}
		}
	}
}

if (pointOn1 == true) and (pointOn2 == false){
	mp_potential_step(obj_Goal1.x, obj_Goal1.y, 10, false);
	if (place_meeting(x, y, obj_Goal1)){
		pointOn2 = true;
	}
}

if (pointOn1 == true) and (pointOn2 == true){
	pointOn1 = false;
	pointOn2 = false;
}