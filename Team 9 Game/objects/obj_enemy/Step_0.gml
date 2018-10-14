// Enemy movement
vspd += grav;

// Collision detection

// TODO: shitty if statements to determine if in spawner zone

if (is_wave_enemy) {
	if (abs(obj_player.x - x) < 256) {
		agro = true;
		agro_multiplier = 2;
	} else {
		agro = false;
		agro_multiplier = 1;
	}
} else {
	if (abs(obj_player.x - x) < 512) {
		agro = true;
		agro_multiplier = 2;
	} else {
		agro = false;
		agro_multiplier = 1;
	}
}
enemy_at_turnaround = place_meeting(x + hspd, y, obj_wall) || place_meeting(x + hspd, y, obj_gap);
enemy_change_direction_delay--;
if (agro && enemy_change_direction_delay < 0) {
	if (abs(obj_player.x - x) > 32 && !enemy_at_turnaround) {
		hspd = sign(obj_player.x - x);
	}
	enemy_change_direction_delay = 30;
}
if (place_meeting(x + hspd, y, obj_wall)) {
	while (!place_meeting(x + sign(hspd), y, obj_wall)) {
		x += sign(hspd);
	}
	hspd = -hspd;
}
if (place_meeting(x + hspd, y, obj_door)) {
	while (!place_meeting(x + sign(hspd), y, obj_door)) {
		x += sign(hspd);
	}
	hspd = -hspd;
}
if (place_meeting(x + hspd, y, obj_gap)) {
	while (!place_meeting(x + sign(hspd), y, obj_gap)) {
		x += sign(hspd);
	}
	hspd = -hspd;
}
if (place_meeting(x, y + vspd, obj_wall)) {
	while (!place_meeting(x, y + sign(vspd), obj_wall)) {
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
if (obj_player.x > x && place_meeting(x + hspd, y, obj_wall)) {
	hspd = 0;
}
if (x < 12) {
	x = 12;
}
if (y < 12) {
	y = 12;
}

// Enemy animation
if (hspd != 0) {
	sprite_index = spr_enemy_run;
	image_xscale = -sign(hspd);
}
// TODO: death animation

// Enemy status
if (enemy_health > 50) {
	enemy_health = 50;
}
if (enemy_health < 0) {
	enemy_health = 0;
}
if ((y > room_height + 32) || (enemy_health <= 0)) {
	enemy_alive = false;
}
if (!enemy_alive) {
	if (instance_exists(obj_enemy_spawner)) {
		with (obj_enemy_spawner) {
			if (triggered) {
				remaining[current_wave]--;
			}
		}
	}
	audio_play_sound(audio_enemy_death, 1, 0);
	instance_destroy();
	with (obj_player) {
		player_energy += 5;
	}
}

// Update position
x += hspd * agro_multiplier;
y += vspd;