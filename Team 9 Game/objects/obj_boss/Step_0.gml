vspd += grav;
hspd = sign(obj_player.x - x);

agro = abs(obj_player.x - x) < 256;


attack_cooldown--;
anim_reset_timer--;
if (agro && attack_cooldown < 0) {
	sprite_index = spr_boss_attack;
	image_index = 0;
	hspd *= 0.5;
	attack_cooldown = 200;
	anim_reset_timer = 50;
} else if (anim_reset_timer < 0 && sprite_index == spr_boss_attack && image_index + image_speed * sprite_get_speed(sprite_index) >= image_number) {
	sprite_index = spr_boss_walk;
	image_index = 0;
	hspd *= 2;
}
//show_debug_message(string(attack_cooldown));

if (place_meeting(x + hspd, y, obj_wall)) {
	while (!place_meeting(x, y, obj_wall)) {
		x += sign(hspd);
	}
}
if (place_meeting(x, y + vspd, obj_wall)) {
	while (!place_meeting(x, y + sign(vspd), obj_wall)) {
		y += sign(vspd);
	}
	vspd = 0;
}

image_xscale = 2 * -sign(hspd);
image_yscale = 2;


// Enemy status
if (enemy_health > 500) {
	enemy_health = 500;
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
	game_over = true;
}

// Update position
x += hspd * agro_multiplier;
y += vspd;