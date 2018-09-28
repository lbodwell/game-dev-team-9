// Draw health bar
if (obj_player.player_health >= 0) {
	draw_healthbar(view_xport[0] + 64, view_yport[0] + 64, (view_xport[0] + 384), view_yport[0] + 96, draw_health, c_black, c_red, c_red, 0, true, false);
}

// Draw energy bar
draw_healthbar(view_xport[0] + 640, view_yport[0] + 64, (view_xport[0] + 960), view_yport[0] + 96, draw_energy, c_black, c_green, c_green, 0, true, false);

// Draw pause menu
if (game_paused) {
	draw_set_color(c_black);
	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0);
	draw_set_font(fnt_pause);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(view_wport[0] / 2, view_hport[0] / 2 - 128, "Paused");
}