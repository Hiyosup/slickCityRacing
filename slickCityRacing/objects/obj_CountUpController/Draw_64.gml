/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntPrimary);
draw_set_color(c_lime);

if (global.hours < 10){
	if (global.minutes < 10){
		if (global.seconds < 10){
			draw_text(vx, vy,  "Time " + "0" + string(global.hours) + ":0" + string(global.minutes) + ":0" + string(global.seconds));
		}
		else if (global.seconds >= 10){
			draw_text(vx, vy,  "Time " + "0" + string(global.hours) + ":0" + string(global.minutes) + ":" + string(global.seconds));
		}
	}
	else if (global.minutes >= 10){
		if (global.seconds < 10){
			draw_text(vx, vy,  "Time " + "0" + string(global.hours) + ":" + string(global.minutes) + " :0" + string(global.seconds));
		}
		else if (global.seconds >= 10){
			draw_text(vx, vy,  "Time " + "0" + string(global.hours) + ":" + string(global.minutes) + " :" + string(global.seconds));
		}
	}
}
else if(global.hours >= 10){
	if (global.minutes < 10){
		if (global.seconds < 10){
			draw_text(vx, vy,  "Time " + string(global.hours) + ":0" + string(global.minutes) + ":0" + string(global.seconds));
		}
		else if (global.seconds >= 10){
			draw_text(vx, vy,  "Time " + string(global.hours) + ":0" + string(global.minutes) + ":" + string(global.seconds));
		}
	}
	else if (global.minutes >= 10){
		if (global.seconds < 10){
			draw_text(vx, vy,  "Time " + string(global.hours) + ":" + string(global.minutes) + ":0" + string(global.seconds));
		}
		else if (global.seconds >= 10){
			draw_text(vx, vy,  "Time " + string(global.hours) + ":" + string(global.minutes) + ":" + string(global.seconds));
		}
	}
}