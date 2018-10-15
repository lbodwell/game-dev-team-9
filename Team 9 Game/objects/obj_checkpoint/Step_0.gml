// Update checkpoint
if (place_meeting(x, y, obj_player)) {
	global.checkpoint = id;
	global.cp_room = room;
	global.cp_x = x;
	global.cp_y = y;
	with (obj_player) {
		player_health += 10;
		player_energy += 10;
	}
}
if (global.cp_room == room) {
	if (global.checkpoint == id) {
		image_index = 1;
	} else {
		image_index = 0;
	}
}