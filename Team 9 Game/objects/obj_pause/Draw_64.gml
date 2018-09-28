// Draw pause menu
if (game_paused) {
	draw_set_color(c_black);
	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0);
	draw_set_color(c_white);
	draw_set_font(fnt_ui_large);
	draw_set_halign(fa_center);
	draw_text(view_wport[0] / 2, view_hport[0] / 2 - 128, "Paused");
}