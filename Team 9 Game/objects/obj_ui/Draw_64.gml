// Draw health bar
if (obj_player.player_health >= 0) {
	draw_healthbar(view_xport[0] + 64, view_yport[0] + 64, (view_xport[0] + 384), view_yport[0] + 96, draw_health, c_black, c_red, c_red, 0, true, false);
}

// Draw energy bar
draw_healthbar(view_xport[0] + 640, view_yport[0] + 64, (view_xport[0] + 960), view_yport[0] + 96, draw_energy, c_black, c_blue, c_blue, 0, true, false);

// Draw next level promopt
if (obj_player.level_complete) {
	draw_set_color(c_black);
	draw_set_font(fnt_ui_med);
	draw_set_halign(fa_center);
	draw_text(view_xport[0] + 512, view_yport[0] + 320 , "Press enter to go to next level");
}