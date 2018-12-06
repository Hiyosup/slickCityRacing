/// @description Insert description here
// You can write your code in this editor
if (global.count_up == true)
{
	global.seconds += 1/room_speed;
}

if (global.seconds >= 60)
{
	global.seconds = 0;
	global.minutes += 1;
}

if (global.minutes >= 60)
{
	global.minutes = 0;
	global.hours += 1;
}	