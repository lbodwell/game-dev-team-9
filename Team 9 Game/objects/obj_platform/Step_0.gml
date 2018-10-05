 if (triggered) {
	if (timer == 0) {
		instance_destroy();
	} else {
		timer--;
		image_alpha -= 0.01;
	}
} else if (place_meeting(x, y-1, obj_player)) {
	triggered = true;
}