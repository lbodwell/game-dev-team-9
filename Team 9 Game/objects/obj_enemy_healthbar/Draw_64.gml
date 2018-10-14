if (instance_exists(obj_boss)) {
	with (obj_boss) {
		if (enemy_health >= 0) {
			draw_healthbar(x - 128 - view_xport[0], y - 160, x + 128 - view_xport[0], y - 128, other.draw_health, c_black, c_red, c_red, 0, true, false);
		}
	}
}