// Draw pause menu
if (game_paused) {
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0);
	draw_set_font(fnt_pause);
	draw_set_alpha(1);
	draw_text(view_wport[0] - 96 / 2, view_hport[0] - 96 / 2, "Paused");
}