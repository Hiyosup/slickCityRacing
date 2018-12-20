//Initial variables
movement = 0;
turning = 0;
acceleration = .15;
backAccel = .15;
topSpeed = 16;
frict = .075;
vSlide = 0;
hSlide = 0;
bounceAngle = 15;
bounceDistance = 32;

//Vehicle color
switch (global.player1){
	case (0):
		sprite_index = sprEagle;
		show_debug_message("Eagle")
		streak = 0;
		break;
	
	case (1):
		sprite_index = sprRaven;
		show_debug_message("Raven")
		streak = 1;
		break;
	
	case (2):
		sprite_index = sprSwan;
		streak = 0;
		break;
	
	case (3):
		sprite_index = sprParakeet;
		streak = 1;
		break;
	
	case (4):
		sprite_index = sprOriole;
		streak = 2;
		break;
	
	case (5):
		sprite_index = sprCardinal;
		streak = 1;
		break;
}

engineForward = audio_play_sound(sndEnginev2, 1, true);
engineBackward = audio_play_sound(sndEnginev3, 1, true);
engineStart = audio_play_sound(sndEngineStart, 1, false);
engineStop = audio_play_sound(sndEngineShutdown, 1, false);