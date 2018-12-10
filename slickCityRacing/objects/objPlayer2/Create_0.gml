//Initial variables
movement = 0;
turning = 0;
acceleration = .5;
backAccel = .3;
topSpeed = 20;
frict = .075;
vSlide = 0;
hSlide = 0;
bounceAngle = 45;
bounceDistance = 32;

//Vehicle color
switch (global.player2){
	case (0):
		sprite_index = sprEagle;
		show_debug_message("Eagle")
		break;
	
	case (1):
		sprite_index = sprRaven;
		show_debug_message("Raven")
		break;
	
	case (2):
		sprite_index = sprSwan;
		break;
	
	case (3):
		sprite_index = sprParakeet;
		break;
	
	case (4):
		sprite_index = sprOriole;
		break;
	
	case (5):
		sprite_index = sprCardinal;
		break;
}

if (global.playerNumber == 0){
	instance_destroy();
}
if (global.playerNumber == 1){
	engineForward = audio_play_sound(sndEnginev2, 1, true);
	engineBackward = audio_play_sound(sndEnginev3, 1, true);
	engineStart = audio_play_sound(sndEngineStart, 1, false);
	engineStop = audio_play_sound(sndEngineShutdown, 1, false);
}