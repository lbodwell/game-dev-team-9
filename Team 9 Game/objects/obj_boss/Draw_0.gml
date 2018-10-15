draw_self();
if (enemy_health >= 0) {
	draw_healthbar(x - 96, y - 176, x + 128, y - 160, other.draw_health, c_black, c_red, c_red, 0, true, false);
}