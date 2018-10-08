// Controls
key_pause = keyboard_check_pressed(vk_escape);

// Pause game
if (key_pause) {
	if (!game_paused) {
		show_debug_message("Game paused");
		audio_pause_sound(audio_music_lvl2);
		instance_deactivate_all(true);
	} else {
		show_debug_message("Game resumed");
		audio_resume_sound(audio_music_lvl2);
		instance_activate_all();
	}
	game_paused = !game_paused;
}
// TODO: make into overlay instead of separate screen (deactivate hides objects)