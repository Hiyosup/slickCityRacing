//Input for  game
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

//Check if we are moving
xaxis = right - left;
yaxis = down - up;


//direction
	dir = point_direction(0,0, xaxis,yaxis);
	
//Get Length
if(xaxis== 0 )&&(yaxis == 0) {
	len = 0;
} else {
	len = spd;
}


//Calculate Where to move
hspd = lengthdir_x(len,dir );
vspd = lengthdir_y(len,dir);

//Move the car


//Horizontal Collisions
if (place_meeting(x +hspd, y, objHorWall)) {
	while(!place_meeting(x+sign(hspd), y, objHorWall)){
		x += sign(hspd);
	}
	hspd = 0; 
}	
if (place_meeting(x +hspd, y, objVertWall)) {
	while(!place_meeting(x+sign(hspd), y, objVertWall)){
		x += sign(hspd);
	}
	hspd = 0; 
}	
x += hspd;
//Vertical Collisions
if (place_meeting(x, y+vspd, objVertWall)) {
	while(!place_meeting(x, y+sign(vspd), objVertWall)){
		x += sign(vspd);
	}
	vspd = 0; 
}	
if (place_meeting(x, y+vspd, objHorWall)) {
	while(!place_meeting(x, y+sign(vspd), objHorWall)){
		x += sign(vspd);
	}
	vspd = 0;
}	
	y += vspd;