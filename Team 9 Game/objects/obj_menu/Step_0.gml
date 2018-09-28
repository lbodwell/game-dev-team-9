// Controls
key_up = keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(ord("S"));
key_back = keyboard_check_pressed(vk_escape);
key_next = keyboard_check_pressed(vk_enter);

// Determine selected button
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
	button_index--;
}
if (key_down) {
	button_index++;
}
if (key_next) {
	switch (button_index) {
		case 0: {
			room_goto(room_test1);
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
if (key_back) {
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
		