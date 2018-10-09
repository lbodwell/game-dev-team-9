if (triggered) {
	var str = "remaining: ";
	for (var i = 0; i < array_length_1d(remaining); i++) {
		str += string(remaining[i]) + "|";
	}
	draw_text(128, 128, str + "\nwaves total: " + string(total_waves) + "\nwave now: " + string(current_wave));
}