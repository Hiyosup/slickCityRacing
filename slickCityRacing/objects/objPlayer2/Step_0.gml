if (image_alpha != 1){
	audio_pause_sound(engineForward);
	audio_pause_sound(engineStart);
	audio_pause_sound(engineStop);
	audio_pause_sound(engineBackward);
}
if (image_alpha == 1){
	//inputs
	up = keyboard_check(vk_numpad3);
	down = keyboard_check(vk_down);
	left = keyboard_check(vk_left);
	right = keyboard_check(vk_right);

	//active variables
	movement = up - down;
	turning = left - right;
	direction = image_angle + 90;
	global.player2Speed = speed * 9;

	//turning
	if (speed != 0){
		if (turning == 1){
			if (speed <= topSpeed/2){
				image_angle += (speed / 3);
			}
			else {
				image_angle += (speed / 5.5);
			}
		}
		else if (turning == -1){
			if (speed <= topSpeed/2){
				image_angle -= (speed / 3);
			}
			else {
				image_angle -= (speed / 5.5);
			}
		}
		//sound
		if (speed*9 < 120) and (speed*9 > -45) and (audio_is_paused(engineStart)){
			if (up) or (down){
				audio_resume_sound(engineStart);
				if (audio_is_playing(engineForward)){
					audio_pause_sound(engineForward);
				}
				if (audio_is_playing(engineBackward)){
					audio_pause_sound(engineBackward);
				}
			}
		}
		else if (speed*9 < 120) and (speed*9 > -45) and (audio_is_paused(engineStop)){
			if (!up) and (!down){
				audio_resume_sound(engineStop);
				if (audio_is_playing(engineForward)){
					audio_pause_sound(engineForward);
				}
				if (audio_is_playing(engineBackward)){
					audio_pause_sound(engineBackward);
				}
			}
		}
		if (speed*9 > 120) and (audio_is_paused(engineForward)){
			audio_resume_sound(engineForward);
			if (audio_is_playing(engineStart)){
				audio_pause_sound(engineStart);
			}
			if (audio_is_playing(engineStop)){
				audio_pause_sound(engineStop);
			}
		}
		if (speed*9 < -45) and (audio_is_paused(engineBackward)){
			audio_resume_sound(engineBackward);
			if (audio_is_playing(engineStart)){
				audio_pause_sound(engineStart);
			}
			if (audio_is_playing(engineStop)){
				audio_pause_sound(engineStop);
			}
		}
	}
	else {
		if (audio_is_playing(engineForward)){
			audio_pause_sound(engineForward);
		}
		if (audio_is_playing(engineStart)){
			audio_pause_sound(engineStart);
		}
		if (audio_is_playing(engineStop)){
			audio_pause_sound(engineStop);
		}
		if (audio_is_playing(engineBackward)){
			audio_pause_sound(engineBackward);
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

	if (speed <= -(topSpeed/2)){
		frict = .55;
	}

	if (speed < topSpeed) and (speed > -(topSpeed/2)){
		frict = .075;
	}

	//collision
	if (place_meeting(x + hspeed, y, objVertWall)) or (place_meeting(x + hspeed, y, objHorWall))
	or (place_meeting(x + hspeed, y, objInsideCorner)) or (place_meeting(x + hspeed, y, objOutsideCornerNE))
	or (place_meeting(x + hspeed, y, objOutsideCornerNW)) or (place_meeting(x + hspeed, y, objOutsideCornerSE))
	or (place_meeting(x + hspeed, y, objOutsideCornerSW)){
		hspeed = hspeed / 2;
		audio_play_sound(sndWallBump,1,false)
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
		audio_play_sound(sndWallBump,1,false)
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
}