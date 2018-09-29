// Controls
key_up = keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(ord("S"));
key_back = keyboard_check_pressed(vk_escape);
key_next = keyboard_check_pressed(vk_enter);
mouse_click = mouse_check_button(mb_left);

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
	if (button_index == 0) {
		button_index = 2;
		
	} else {
		button_index--;
	}
}
if (key_down) {
	if (button_index == 2) {
		button_index = 0;
	} else {
		button_index++;
	}
}
if (key_next || mouse_click) {
	switch (menu_index) {
		case 0: {
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
if (mouse_x > 440 && mouse_x < 584 && mouse_y > 320 && mouse_y < 400) {
	button_index = 0;
} else if (mouse_x > 384 && mouse_x < 640 && mouse_y > 448 && mouse_y < 528) {
	button_index = 1;
} else  if (mouse_x > 448 && mouse_x < 576 && mouse_y > 576 && mouse_y < 656) {
	button_index = 2;
}