movement = 0;
turning = 0;
acceleration = .5;
backAccel = .3;
topSpeed = 20;
frict = .075;
vSlide = 0;
hSlide = 0;
bounceAngle = 45;
bounceDistance = 16;

//Vehicle color
switch (global.player1){
	case (0):
		sprite_index = sprRaven;
		show_debug_message("Eagle")
		break;
	
	case (1):
		sprite_index = sprEagle;
		show_debug_message("Raven")
		break;
	
	case (2):
		sprite_index = sprParakeet;
		break;
	
	case (3):
		sprite_index = sprSwan;
		break;
	
	case (4):
		sprite_index = sprCardinal;
		break;
	
	case (5):
		sprite_index = sprOriole;
		break;
}