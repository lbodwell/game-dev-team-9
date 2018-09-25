// Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D")); 
key_jump = keyboard_check(ord("W"));

// Player movement
var move = key_right - key_left;
hspd = move * spd;
vspd += grav;

//Collision detection
player_on_floor = place_meeting(x, y + 1, obj_wall)
if (player_on_floor && key_jump) {
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
if (x < 12) {
	x = 12;
}
if (y < 12) {
	y = 12;
}

// Player animation
if (hspd != 0) {
	image_xscale = sign(hspd) * 1.33;
	if (!player_on_floor) {
		sprite_index = spr_player_jump;
		image_speed = 0;
		if (sign(vspd) == 1) {
			image_index = 1;
		} else {
			image_index = 0;
		}
	} else {
		sprite_index = spr_player_run;
		image_speed = 1;	
	}
} else {
	sprite_index = spr_player_neutral;
}

// Player status
if (player_energy > 100) {
	player_energy = 100;
}
if (player_energy < 0) {
	player_energy = 0;
}

if (!player_infinite_energy) {
	if (hspd != 0) {
		if (vspd != 0) {
			player_charge_rate = 5;
		} else {
			player_charge_rate = 1;
		}
		player_energy += (0.01 * player_charge_rate);
		show_debug_message("energy: " + string(player_energy));
	}
} else {
	player_energy = 100;
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

//Update position
x += hspd;
y += vspd;