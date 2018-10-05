// Handle player death
audio_play_sound(audio_player_death, 1, 0);
show_debug_message("Player died");
if (global.checkpoint != -4) {
	room_goto(global.cp_room);
} else {
	room_goto(obj_player.current_level);
}