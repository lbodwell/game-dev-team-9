// Pause game
key_pause = keyboard_check_pressed(vk_escape);
if (key_pause) {
	freeze_frame = application_surface;
	if (!game_paused) {
		show_debug_message("Game paused");
		instance_deactivate_all(true);
	} else {
		show_debug_message("Game resumed");
		instance_activate_all();
	}
	game_paused = !game_paused;
}
//TODO: make into overlay instead of separate screen (deactivate hides objects)