switch (room){
	case (rmTrack1):
		draw_text_color(vx, vy + 728, "Speed: " + string(global.player1Speed), $FF99FF, $FF99FF, $FF99FF, $FF99FF, 1)
		draw_text(vx, vy, "Lap: " + string(global.P1lap));
		break;
}
