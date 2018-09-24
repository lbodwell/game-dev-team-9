key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D")); 
key_jump = keyboard_check(ord("W"));

var move = key_right - key_left;

hspd = move * spd;
vspd += grav;

if (place_meeting(x, y + 1, obj_wall) && key_jump) {
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

if (player_health < 0) {
	player_health = 0;
}

if ((y > room_height + 32) || (player_health == 0)) {
	player_alive = false;
}

if (!player_alive) {
	//reset scene
}

x += hspd;
y += vspd;

