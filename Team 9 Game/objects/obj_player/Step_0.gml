// Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D")); 
key_jump = keyboard_check_pressed(vk_space);
key_super_jump = keyboard_check(vk_control);
key_dash = keyboard_check(vk_shift);
key_heal = keyboard_check_pressed(ord("F"));
key_repulsor = mouse_check_button(mb_right);
key_next_level = keyboard_check_pressed(vk_enter);

// Player movement
var move = key_right - key_left;
hspd = move * spd * dash;
vspd += grav;

// Collision detection
player_on_ground = place_meeting(x, y + 1, obj_wall);
player_touching_enemy = place_meeting(x, y, obj_enemy);
if (player_on_ground && key_jump) {
	if (key_super_jump && player_energy >= 25) {
		grav = 0.075;
		player_energy -= 25;
	} else {
		grav = 0.3;
	}
	vspd -= 7;
	audio_play_sound(audio_player_jump, 1, 0);
}
invincibility_frames--;
if (player_touching_enemy && invincibility_frames < 0) {
	player_health -= 20;
	invincibility_frames = 40;
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
if (!player_on_ground) {
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
	full_health_multiplier = 1.25;
} else {
	full_health_multiplier = 1;
}
if (!player_infinite_energy) {
	if ((hspd != 0 || vspd != 0) && dash == 1 && grav == 0.3) {
		if (hspd != 0 && vspd != 0) {
			player_charge_rate = 5;
		} else if (hspd != 0 && vspd == 0) {
		player_charge_rate = 3;
		} else if (hspd == 0 && vspd != 0) {
			player_charge_rate = 2;
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
	show_debug_message("energy: " + string(player_energy));
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
	instance_destroy();
	room_restart();
	show_debug_message("Player died");
}

// Player abilities
if (key_heal && player_energy >= 75 && player_health < 100) {
	player_health += 50;
	player_energy -= 75;
}
allow_dash = (player_energy > 1 && hspd != 0 && player_on_ground);
player_dashing = (dash > 1);
if (key_dash && (allow_dash || player_dashing)) {
	player_energy -= 0.25;
	while (dash < 2) {
		dash += 0.0001;
	}
} else {
	while (dash > 1) {
		dash -= 0.0001;
	}
}
footstep_timer--;
if (footstep_timer < 0 && player_on_ground) {
	if (hspd != 0) {
		footstep_timer = 18 / dash;
		audio_sound_pitch(audio_player_footsteps, random_range(0.7, 1.3));
		audio_play_sound(audio_player_footsteps, 1, 0);
	}
}
image_speed *= dash;

// Position-based events
if (x >= 4000) {
	level_complete = true;
}
if (level_complete && key_next_level) {
	room_goto(inside_rocket_rm);
}

// Update position
x += hspd;
y += vspd;