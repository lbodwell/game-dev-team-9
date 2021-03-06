// Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D")); 
key_jump = keyboard_check_pressed(vk_space);
key_super_jump = keyboard_check(vk_control);
key_sprint = keyboard_check(vk_shift);
key_heal = keyboard_check_pressed(ord("F"));
key_repulsor = mouse_check_button_pressed(mb_right);
key_next_level = keyboard_check_pressed(vk_enter);
key_lvl1 = keyboard_check_pressed(ord("1"));
key_lvl2_start = keyboard_check_pressed(ord("2"));
key_lvl2_waves = keyboard_check_pressed(ord("3"));
key_lvl4 = keyboard_check_pressed(ord("4"));
key_infinite_energy = keyboard_check_pressed(ord("I"));
key_infinite_health = keyboard_check_pressed(ord("H"));
window_set_cursor(cr_cross);

// Developer mode
if (developer_mode) {
	player_infinite_energy = true;
	player_infinite_health = true;
	grav = 0.075;
}

// Player movement
var move = key_right - key_left;
hspd = move * spd * sprint * slow_block_multiplier;
vspd += grav;

// Collision detection
player_on_ground = place_meeting(x, y + 1, obj_wall);
player_on_platform = place_meeting(x, y + 1, obj_platform);
player_on_door = place_meeting(x, y + 1, obj_door);
player_on_slow_block = place_meeting(x, y + 1, obj_slow_block);
player_touching_enemy = place_meeting(x, y, obj_enemy);
player_touching_spike = place_meeting(x, y + 1, obj_spike);
if ((player_on_ground || player_on_platform || player_on_door || player_on_slow_block) && key_jump) {
	audio_play_sound(audio_player_jump, 1, 0);
	if (key_super_jump && player_energy >= 15) {
		player_energy -= 15;
		grav = 0.075;
	} else {
		grav = 0.3;
	} 
	vspd -= 7;
}
if (player_on_slow_block && !developer_mode) {
	slow_block_multiplier = 0.5;
} else {
	slow_block_multiplier = 1;
}
invincibility_frames--;
if (player_touching_enemy && invincibility_frames < 0) {
	if (player_health > 20) {
		audio_play_sound(audio_player_damage, 1, 0);
	}
	player_health -= 20;
	invincibility_frames = 40;
}
if (player_touching_spike) {
	player_health -= 100;
}
if (place_meeting(x + hspd, y, obj_wall) && !developer_mode) {
	while (!place_meeting(x + sign(hspd), y, obj_wall)) {
		x += sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x + hspd, y, obj_platform) && !developer_mode) {
	while (!place_meeting(x + sign(hspd), y, obj_platform)) {
		x += sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x + hspd, y, obj_door) && !developer_mode) {
	while (!place_meeting(x + sign(hspd), y, obj_door)) {
		x += sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x + hspd, y, obj_slow_block) && !developer_mode) {
	while (!place_meeting(x + sign(hspd), y, obj_slow_block)) {
		x += sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x + hspd, y, obj_destructable) && !developer_mode) {
	while (!place_meeting(x + sign(hspd), y, obj_destructable)) {
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
if (place_meeting(x, y + vspd, obj_platform)) {
	while (!place_meeting(x, y + sign(vspd), obj_platform)) {
		y += sign(vspd);
	}
	vspd = 0;
}
if (place_meeting(x, y + vspd, obj_door)) {
	while (!place_meeting(x, y + sign(vspd), obj_door)) {
		y += sign(vspd);
	}
	vspd = 0;
}
if (place_meeting(x, y + vspd, obj_slow_block)) {
	while (!place_meeting(x, y + sign(vspd), obj_slow_block)) {
		y += sign(vspd);
	}
	vspd = 0;
}
if (place_meeting(x, y + vspd, obj_destructable)) {
	while (!place_meeting(x, y + sign(vspd), obj_destructable)) {
		y += sign(vspd);
	}
	vspd = 0;
}
if (x < 16) {
	x = 16;
}
if (x > room_width - 16) {
	x = room_width - 16;
}
if (y < 16) {
	y = 16;
}

// Player animation	
if (!(player_on_ground || player_on_platform || player_on_door || player_on_slow_block)) {
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
		image_speed = slow_block_multiplier;
	} else {
		sprite_index = spr_player_neutral;
	}
}
if (hspd != 0) {
	image_xscale = sign(hspd) * 1.33;
}
with (obj_gun) {
	player_dir = sign(other.hspd);
}

// Player status
if (player_health >= 100) {
	full_health_multiplier = 1.25;
} else {
	full_health_multiplier = 1;
}
if (room == room_lvl4) {
	boss_level_multiplier = 3;
} else {
	boss_level_multiplier = 1;
}
if (!player_infinite_energy) {
	if ((hspd != 0 || vspd != 0) && sprint == 1 && grav == 0.3) {
		if (hspd != 0 && vspd != 0) {
			player_charge_rate = 5;
		} else if (hspd != 0 && vspd == 0) {
		player_charge_rate = 3;
		} else if (hspd == 0 && vspd != 0) {
			player_charge_rate = 1.5;
		}
	} else {
		player_charge_rate = 0;
	}
	player_charge_rate *= (full_health_multiplier * boss_level_multiplier);
} else {
	player_energy = 100;
}
if (player_energy > 100) {
	player_energy = 100;
}
if (player_energy < 0) {
	player_energy = 0;
}
player_energy += (0.005 * player_charge_rate);
if (player_charge_rate != 0) {
	//show_debug_message("energy: " + string(player_energy));
}
if (player_health > 100) {
	player_health = 100;
}
if (player_health < 0) {
	player_health = 0;
}
if (player_infinite_health) {
	player_health = 100;
}
if ((y > room_height + 32) || (player_health == 0)) {
	player_alive = false;
}
if (!player_alive) {
	player_death(player_energy);
}

// Player abilities
if (key_heal && player_energy >= 30 && player_health < 100) {
	player_health += 50;
	player_energy -= 30;
}
allow_sprint = (player_energy > 1 && hspd != 0 && (player_on_ground || player_on_platform || player_on_door));
player_sprinting = sprint > 1 && player_energy > 1;
if (key_sprint && (allow_sprint || player_sprinting)) {
	player_energy -= 0.1;
	while (sprint < 2) {
		sprint += 0.0001;
	}
} else {
	while (sprint > 1) {
		sprint -= 0.0001;
	}
}
if (key_repulsor && player_energy >= 50) {
	audio_play_sound(audio_player_repulsor, 1, 0);
	player_energy -= 50;
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 0 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 22.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 45 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 67.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 90 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 112.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 135 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 157.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 180 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 202.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 225 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 247.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 270 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 292.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 315 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Projectiles", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 337.5 + random_range(-3, 3);
		image_angle = direction;
	}
}
footstep_timer--;
if (footstep_timer < 0 && (player_on_ground || player_on_platform || player_on_door || player_on_slow_block)) {
	if (hspd != 0) {
		audio_sound_pitch(audio_player_footsteps, slow_block_multiplier * random_range(0.7, 1.3));
		audio_play_sound(audio_player_footsteps, 1, 0);
		footstep_timer = 18 / sprint / slow_block_multiplier;
	}
}
image_speed *= sprint;

// Position-based events
// Move to tutorial level
if (show_hints) {
	if (room == room_lvl1) {
		if ((x > 32 && x < 4192) && y < 832)  {
			// move and jump
			show_hint = 1;
		} else if (y > 1280 && y < 2208) {
			// falling platforms
			show_hint = 2;
		} else if (x > 192 && y > 1728) {
			// sprint
			show_hint = 3;
		} else {
			// none
			show_hint = 0;
		}
	}
	if (room == room_lvl2) {
		if (x > 4192 && x < 6048) {
			// shoot
			show_hint = 4;
		} else if (x > 6048 && x < 7776) {
			// super jump
			show_hint = 5;
		} else if (x > 7776 && x < 10208) {
			// repulsor for enemies
			show_hint = 6;
		} else if (x > 10208 && x < 11520) {
			// heal
			show_hint = 7;
		} else if (x > 11520 && x < 12448) {
			// repulsor for objects
			show_hint = 8;
		} else if (x > 12448 && x < 14272) {
			// sprint and super jump
			show_hint = 9;
		} else {
			// none
			show_hint = 0;
		}
	}
} else {
	show_hint = 0;
}
/*if (level_complete && key_next_level) {
	audio_stop_all();
	room_goto_next();
}*/

// Demo cheats
if (cheats) {
	if (key_lvl1) {
		audio_stop_all();
		instance_destroy();
		room_goto(room_lvl1);
	}
	if (key_lvl2_start) {
		audio_stop_all();
		instance_destroy();
		global.checkpoint = noone;
		global.cp_room = room_lvl2;
		global.cp_x = 64;
		global.cp_y = 768;
		room_goto(room_lvl2);
	}
	if (key_lvl2_waves) {
		audio_stop_all();
		instance_destroy();
		global.checkpoint = inst_591C94D3;
		global.cp_room = room_lvl2;
		global.cp_x = 22848;
		global.cp_y = 2816;
		room_goto(room_lvl2);
	}
	if (key_lvl4) {
		audio_stop_all();
		instance_destroy();
		room_goto(room_lvl4);
	}
	if (key_infinite_energy) {
		player_infinite_energy = !player_infinite_energy;
	}
	if (key_infinite_health) {
		player_infinite_health = !player_infinite_health;
	}
}

// Audio handling
if (audio_is_playing(audio_music_menu)) {
	audio_stop_sound(audio_music_menu);
}

if (room == room_lvl1) {
	audio_stop_sound(audio_music_menu);
	audio_stop_sound(audio_music_lvl2);
	audio_stop_sound(audio_music_lvl4);
}
if (room == room_lvl2) {
	audio_stop_sound(audio_music_menu);
	audio_stop_sound(audio_music_lvl1);
	audio_stop_sound(audio_music_lvl4);
}
if (room == room_lvl4) {
	audio_stop_sound(audio_music_menu);
	audio_stop_sound(audio_music_lvl1);
	audio_stop_sound(audio_music_lvl2);
}

switch (room_get_name(room)) {
	case "room_lvl1": {
		if (music_on) {
			if (!audio_is_playing(audio_music_lvl1)) {
				audio_play_sound(audio_music_lvl1, 1, 0);
			}
		}
	}
	break;
	case "room_lvl2": {
		if (music_on) {
			if (!audio_is_playing(audio_music_lvl2)) {
				audio_play_sound(audio_music_lvl2, 1, 0);
			}
		}
	}
	break;
	case "room_lvl4": {
		if (music_on) {
			if (!audio_is_playing(audio_music_lvl4)) {
				audio_play_sound(audio_music_lvl4, 1, 0);
			}
		}
	}
	break;
}


// Update position
x += hspd;
y += vspd;

