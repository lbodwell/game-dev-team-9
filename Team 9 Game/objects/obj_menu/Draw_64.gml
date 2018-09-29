// Draw main menu
switch (menu_index) {
	case 0: {
		draw_set_color(c_blue);
		if (button_index = 0) {
			draw_set_alpha(0.8);
		} else {
			draw_set_alpha(0);
		}
		draw_rectangle(440, 320, 584, 400, false);
		if (button_index = 1) {
			draw_set_alpha(0.8);
		} else {
			draw_set_alpha(0);
		}
		draw_rectangle(384, 448, 640, 528, false);
		if (button_index = 2) {
			draw_set_alpha(0.8);
		} else {
			draw_set_alpha(0);
		}
		draw_rectangle(448, 576, 576, 656, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_font(fnt_ui_large);
		draw_set_halign(fa_center);
		draw_text(512, 128, "Game Name");
		draw_set_font(fnt_ui_med);
		draw_text(512, 320, "Play");
		draw_text(512, 448, "Options");
		draw_text(512, 576, "Exit");
	}
	break;
	case 1: {
		draw_set_color(c_blue);
		if (button_index = 0) {
			draw_set_alpha(0.8);
		} else {
			draw_set_alpha(0);
		}
		draw_rectangle(440, 320, 584, 400, false);
		if (button_index = 1) {
			draw_set_alpha(0.8);
		} else {
			draw_set_alpha(0);
		}
		draw_rectangle(384, 448, 640, 528, false);
		if (button_index = 2) {
			draw_set_alpha(0.8);
		} else {
			draw_set_alpha(0);
		}
		draw_rectangle(448, 576, 576, 656, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_font(fnt_ui_large);
		draw_set_halign(fa_center);
		draw_text(512, 128, "Options");
		draw_set_font(fnt_ui_med);
		draw_text(512, 320, "Video");
		draw_text(512, 448, "Audio");
		draw_text(512, 576, "Back");
	}
	break;
	case 2: {
		// video options
	}
	break;
	case 3: {
		// audio options
	}
	break;
}