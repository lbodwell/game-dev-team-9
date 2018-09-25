// Pause game
key_pause = keyboard_check_pressed(vk_escape);
if (key_pause) {
	if (!game_paused) {
		show_debug_message("Game paused");
		instance_deactivate_all(true);
	} else {
		show_debug_message("Game resumed");
		instance_activate_all();
	}
	game_paused = !game_paused;
}
