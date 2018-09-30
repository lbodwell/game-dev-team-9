// Enemy movement
vspd += grav;

// Collision detection
if (abs(obj_player.x - x) < 160) {
	agro = true;
	agro_multiplier = 2;
} else {
	agro = false;
	agro_multiplier = 1;
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
	audio_play_sound(audio_enemy_death, 1, 0);
	instance_destroy();
	with (obj_player) {
		player_energy += 5;
	}
}

// Update position
x += hspd * agro_multiplier;
y += vspd;