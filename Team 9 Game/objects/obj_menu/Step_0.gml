 // Controls
key_up = keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(ord("S"));
key_back = keyboard_check_pressed(vk_escape);
key_next = keyboard_check_pressed(vk_enter);
mouse_click = mouse_check_button_pressed(mb_left);

// Handle mouse input
mouse_on_button1 = mouse_x > 440 && mouse_x < 584 && mouse_y > 320 && mouse_y < 400;
mouse_on_button2 = mouse_x > 384 && mouse_x < 640 && mouse_y > 448 && mouse_y < 528;
mouse_on_button3 = mouse_x > 448 && mouse_x < 576 && mouse_y > 576 && mouse_y < 656;
if (mouse_on_button1) {
	if (button_index != 0) {
		audio_sound_pitch(audio_ui_navigate, 2);
		audio_play_sound(audio_ui_navigate, 1, 0);
	}
	button_index = 0;
} else if (mouse_on_button2) {
	if (button_index != 1) {
		audio_sound_pitch(audio_ui_navigate, 2);
		audio_play_sound(audio_ui_navigate, 1, 0);
	}
	button_index = 1;
} else  if (mouse_on_button3) {
	if (button_index != 2) {
		audio_sound_pitch(audio_ui_navigate, 2);
		audio_play_sound(audio_ui_navigate, 1, 0);
	}
	button_index = 2;
}

// Handle menu navigation
if (button_index < 0) {
	button_index = 0;
}
if (button_index > 2) {
	button_index = 2;
}
if (menu_index < 0) { 
	menu_index = 0;
}
if (menu_index > 3) {
	menu_index = 3;
}
if (key_up) {
	audio_sound_pitch(audio_ui_navigate, 2);
	audio_play_sound(audio_ui_navigate, 1, 0);
	if (button_index == 0) {
		button_index = 2;
	} else {
		button_index--;
	}
}
if (key_down) {
	audio_sound_pitch(audio_ui_navigate, 2);
	audio_play_sound(audio_ui_navigate, 1, 0);
	if (button_index == 2) {
		button_index = 0;
	} else {
		button_index++;
	}
}
if (key_next || (mouse_click && (mouse_on_button1 || mouse_on_button2 || mouse_on_button3))) {
	audio_sound_pitch(audio_ui_navigate, 1);
	audio_play_sound(audio_ui_navigate, 1, 0);
	switch (menu_index) {
		case 0: {
			switch (button_index) {
				case 0: {
					audio_stop_all();
					//room_goto(room_lvl1);
					//room_goto(room_lvl2);
					room_goto(room_lvl4);
					instance_destroy();
				}
				break;
				case 1: {
					menu_index = 1;
				}		
				break;
				case 2: {
					game_end();
				}
				break;
			}
		}
		break;
		case 1: {
			switch (button_index) {
				case 0: {
					menu_index = 2;
				}
				break;
				case 1: {
					menu_index = 3;
				}		
				break;
				case 2: {
					menu_index = 0;
				}
				break;
			}
		}
		break;
	}
}
if (key_back) {
	audio_sound_pitch(audio_ui_navigate, 1);
	audio_play_sound(audio_ui_navigate, 1, 0);
	switch (menu_index) {
		case 1: {
			menu_index = 0;
		}
		break;
		case 2: {
			menu_index = 1;
		}
		break;
		case 3: {
			menu_index = 1;
		}
		break;
		default: {
			menu_index = 0;
		}
	}
}

if (global.music_on && room == room_menu) {
	if (!audio_is_playing(audio_music_menu)) {
		audio_play_sound(audio_music_menu, 1, 0);
	}
}