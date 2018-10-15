agro = abs(obj_player.x - x) < 512;

firing_delay--;
if (agro && firing_delay < 0) {
	firing_delay = 50;
	with (instance_create_layer(x, y + 32, "Projectiles", obj_enemy_projectile)) {
		speed = 20;
		direction = point_direction(x, y, obj_player.x, obj_player.y) + random_range(-16, 16);
		image_angle = direction;
	}
}

if (enemy_health > 25) {
	enemy_health = 25;
}
if (enemy_health < 0) {
	enemy_health = 0;
}
if (enemy_health <= 0) {
	enemy_alive = false;
}
if (!enemy_alive) {
	audio_play_sound(audio_enemy_death, 1, 0);
	instance_destroy();
	with (obj_player) {
		if (other.death_cause == 0) {
			player_energy += 5;
		} else if (other.death_cause == 1) {
			player_energy += 2.5;
		}
	}
}

image_xscale = 1.5 * -sign(obj_player.x - x);
