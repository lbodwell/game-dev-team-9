// Handle player death
audio_play_sound(audio_player_death, 1, 0);
show_debug_message("Player died");
if (global.checkpoint != 0) {
	room_goto(global.cp_room);
} else {
	room_restart();
}