// Enemy movement
vspd += grav;

// Collision detection
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

// Enemy animation
if (hspd != 0) {
	image_xscale = sign(hspd);
}
//TODO: death animation

// Enemy status
if (enemy_health > 50) {
	enemy_health = 50;
}
if (enemy_health < 0) {
	enemy_health = 0;
}
if ((y > room_height + 32) || (enemy_health == 0)) {
	enemy_alive = false;
}
if (!enemy_alive) {
	instance_destroy();
}

// Update position
x += hspd;
y += vspd;