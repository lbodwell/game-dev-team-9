key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D")); 
key_jump = keyboard_check(ord("W"));
key_pause = keyboard_check_pressed(vk_escape);

var move = key_right - key_left;

hspd = move * spd;
vspd += grav;

if (key_pause) {
	game_paused = !game_paused;
}

if (!game_paused) {
	player_on_floor = place_meeting(x, y + 1, obj_wall)
	if (player_on_floor && key_jump) {
		vspd -= 7;
	}
	if (place_meeting(x + hspd, y, obj_wall)) {
		while (!place_meeting(x + sign(hspd), y, obj_wall)) {
			x += sign(hspd);
		}
		hspd = 0;
	}
	if (place_meeting(x, y + vspd, obj_wall)) {
		while (!place_meeting(x, y + sign(vspd), obj_wall)) {
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	if (x < 12) {
		x = 12;
	}
	if (y < 12) {
		y = 12;
	}
	if (player_health < 0) {
		player_health = 0;
	}
	if ((y > room_height + 32) || (player_health == 0)) {
		player_alive = false;
	}
	if (!player_alive) {
		room_restart();
		show_debug_message("Player died");
	}
	
	x += hspd;
	y += vspd;
	
	if (!player_on_floor) {
		sprite_index = spr_player_jump;
		image_speed = 0;
		if (sign(vspd) == 1) {
			image_index = 1;
		} else {
			image_index = 0;
		}
	} else {
		if (hspd != 0) {
			sprite_index = spr_player_run;
			image_speed = 1;
			image_xscale = sign(hspd) * 1.33;
		} else {
			sprite_index = spr_player_neutral;
		}
	}
	
} else {
	//TODO: fix pause menu
	draw_set_color(c_black);
	draw_set_font(fnt_pause);
	draw_text(room_width / 2, room_width / 4, "Paused");
	show_debug_message("Game paused");
}