draw_set_color(c_gray);
if (button_index = 0) {
	draw_set_alpha(0.6);
} else {
	draw_set_alpha(0);
}
draw_rectangle(352, 320, 672, 400, false);
if (button_index = 1) {
	draw_set_alpha(0.6);
} else {
	draw_set_alpha(0);
}
draw_rectangle(448, 448, 576, 528, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_ui_med);
draw_set_halign(fa_center);
draw_text(512, 128, "Congratulations!\nYou beat the game!");
if (button_index == 0) {
	draw_set_color(c_blue);
} else {
	draw_set_color(c_white);
}
draw_set_font(fnt_ui_med);
draw_text(512, 320, "Play Again");
if (button_index == 1) {
	draw_set_color(c_blue);
} else {
	draw_set_color(c_white);
}
draw_text(512, 448, "Exit");