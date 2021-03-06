// Controls
key_shoot = mouse_check_button(mb_left);

// Handle weapon firing
image_angle = point_direction(x, y, mouse_x, mouse_y);
firing_delay--;
recoil = max (0, recoil - 1);
if (key_shoot && firing_delay < 0 ) {
	recoil = 3;
	firing_delay = 6;
	with (instance_create_layer(x + 6, y, "Projectiles", obj_laser)) {
		speed = 25;
		direction = other.image_angle + random_range(-2, 2);
		image_angle = direction;
	}
	audio_sound_pitch(audio_weapon_fire_ar, random_range(0.95, 1.05));
	audio_play_sound(audio_weapon_fire_laser, 1, 0);
}
if ((image_angle > 90 && image_angle < 270) || player_dir == -1) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}

// Update position
x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);