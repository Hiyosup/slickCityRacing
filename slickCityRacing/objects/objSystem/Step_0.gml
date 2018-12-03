if (keyboard_check_pressed(vk_escape)){
	game_end();
}
if (keyboard_check_pressed(vk_f1)) and (window_get_fullscreen()){
	window_set_fullscreen(false)
}
else if (keyboard_check_pressed(vk_f1)) and (!window_get_fullscreen()){
	window_set_fullscreen(true)
}