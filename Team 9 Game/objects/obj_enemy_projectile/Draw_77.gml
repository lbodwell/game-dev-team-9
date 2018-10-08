if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_platform) || place_meeting(x, y, obj_destructable)) {
	instance_destroy();
}