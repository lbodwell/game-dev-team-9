// Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D")); 
key_jump = keyboard_check_pressed(vk_space);
key_super_jump = keyboard_check(vk_control);
key_sprint = keyboard_check(vk_shift);
key_heal = keyboard_check_pressed(ord("F"));
key_repulsor = mouse_check_button_pressed(mb_right);
key_next_level = keyboard_check_pressed(vk_enter);

// Developer mode
if (developer_mode) {
	player_infinite_energy = true;
	grav = 0.075;
}

// Player movement
var move = key_right - key_left;
hspd = move * spd * sprint;
vspd += grav;

// Collision detection
player_on_ground = place_meeting(x, y + 1, obj_wall);
player_on_platform = place_meeting(x, y + 1, obj_platform);
player_touching_enemy = place_meeting(x, y, obj_enemy);
player_touching_spike = place_meeting(x, y, obj_spike);
if ((player_on_ground || player_on_platform) && key_jump) {
	audio_play_sound(audio_player_jump, 1, 0);
	if (key_super_jump && player_energy >= 15) {
		player_energy -= 15;
		grav = 0.075;
	} else {
		grav = 0.3;
	}
	vspd -= 7;
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
if (!(player_on_ground || player_on_platform)) {
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
	} else {
		sprite_index = spr_player_neutral;
	}
}
if (hspd != 0) {
	image_xscale = sign(hspd) * 1.33;
}

// Player status
if (player_health >= 100) {
	full_health_multiplier = 1.5;
} else {
	full_health_multiplier = 1;
}
if (!player_infinite_energy) {
	if ((hspd != 0 || vspd != 0) && sprint == 1 && grav == 0.3) {
		if (hspd != 0 && vspd != 0) {
			player_charge_rate = 3;
		} else if (hspd != 0 && vspd == 0) {
		player_charge_rate = 2;
		} else if (hspd == 0 && vspd != 0) {
			player_charge_rate = 1;
		}
	} else {
		player_charge_rate = 0;
	}
	player_charge_rate *= full_health_multiplier;
} else {
	player_energy = 100;
}
if (player_energy > 100) {
	player_energy = 100;
}
if (player_energy < 0) {
	player_energy = 0;
}
player_energy += (0.01 * player_charge_rate);
if (player_charge_rate != 0) {
	//show_debug_message("energy: " + string(player_energy));
}
if (player_health > 100) {
	player_health = 100;
}
if (player_health < 0) {
	player_health = 0;
}
if ((y > room_height + 32) || (player_health == 0)) {
	player_alive = false;
}
if (!player_alive) {
	audio_play_sound(audio_player_death, 1, 0);
	instance_destroy();
	room_restart();
	show_debug_message("Player died");
}

// Player abilities
if (key_heal && player_energy >= 30 && player_health < 100) {
	player_health += 50;
	player_energy -= 30;
}
allow_sprint = (player_energy > 1 && hspd != 0 && (player_on_ground || player_on_platform));
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
if (key_repulsor && player_energy >= 40) {
	audio_play_sound(audio_player_repulsor, 1, 0);
	player_energy -= 40;
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 0 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 22.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 45 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 67.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 90 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 112.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 135 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 157.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 180 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 202.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 225 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 247.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 270 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 292.5 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 315 + random_range(-3, 3);
		image_angle = direction;
	}
	with (instance_create_layer(x, y, "Bullets", obj_repulsor_ray)) {
		speed = 15 + random_range (-2, 2);
		direction = 337.5 + random_range(-3, 3);
		image_angle = direction;
	}
}
footstep_timer--;
if (footstep_timer < 0 && (player_on_ground || player_on_platform)) {
	if (hspd != 0) {
		audio_sound_pitch(audio_player_footsteps, random_range(0.7, 1.3));
		audio_play_sound(audio_player_footsteps, 1, 0);
		footstep_timer = 18 / sprint;
	}
}
image_speed *= sprint;

// Position-based events

if (x > 0 && x < 1024) {
	// move and jump
	show_hint = 1;
} else if (x > 1024 && x < 3648) {
	// falling platforms
	show_hint = 2;
} else if (x > 3648 && x < 4192) {
	// sprint
	show_hint = 3;
} else if (x > 4192 && x < 6048) {
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
} else if (x > 14912) {
	// beat level
	show_hint = 10;
	level_complete = true;
} else {
	// none
	show_hint = 0;
}

if (level_complete && key_next_level) {
	audio_stop_all();
	room_goto(room_menu);
}

// Update position
x += hspd;
y += vspd;