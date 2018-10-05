// Update checkpoint
if (place_meeting(x, y, obj_player)) {
	global.checkpoint = id;
	global.cp_room = room;
	global.cp_x = x;
	global.cp_y = y;
}
if (global.cp_room == room) {
	if (global.checkpoint == id) {
		image_index = 1;
	} else {
		image_index = 0;
	}
}