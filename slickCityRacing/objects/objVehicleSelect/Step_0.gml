if (global.p1Locked == true) and (global.p2Locked == true){
	global.p1Locked = false;
	global.p2Locked = false;
	room_goto(rmTrack1);
}
else if (global.p1Locked == true) and (!instance_exists(objSelectP2)){
	global.p1Locked = false;
	room_goto(rmTrack1);
}