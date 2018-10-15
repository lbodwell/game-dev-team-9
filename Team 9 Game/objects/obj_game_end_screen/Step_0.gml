 // Controls
key_up = keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(ord("S"));
key_back = keyboard_check_pressed(vk_escape);
key_next = keyboard_check_pressed(vk_enter);
mouse_click = mouse_check_button_pressed(mb_left);

// Handle mouse input
mouse_on_button1 = mouse_x > 351 && mouse_x < 672 && mouse_y > 320 && mouse_y < 400;
mouse_on_button2 = mouse_x > 448 && mouse_x < 576 && mouse_y > 448 && mouse_y < 528;
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
if (button_index > 1) {
	button_index = 1;
}
if (key_up) {
	audio_sound_pitch(audio_ui_navigate, 2);
	audio_play_sound(audio_ui_navigate, 1, 0);
	if (button_index == 0) {
		button_index = 1;
	} else {
		button_index--;
	}
}
if (key_down) {
	audio_sound_pitch(audio_ui_navigate, 2);
	audio_play_sound(audio_ui_navigate, 1, 0);
	if (button_index == 1) {
		button_index = 0;
	} else {
		button_index++;
	}
}
if (key_next || (mouse_click && (mouse_on_button1 || mouse_on_button2))) {
	audio_sound_pitch(audio_ui_navigate, 1);
	audio_play_sound(audio_ui_navigate, 1, 0);
	switch (button_index) {
		case 0: {
			audio_stop_all();
			room_goto(room_menu);
			instance_destroy();
		}
		break;
		case 1: {
			game_end();
		}		
		break;
	}
}