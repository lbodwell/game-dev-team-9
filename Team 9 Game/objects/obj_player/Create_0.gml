// Set initial position
switch (room_get_name(room)) {
	case "room_lvl1": {
		//TODO: add spawnpoint
	}
	break;
	case "room_lvl2": {
		//x = 64;
		//y = 768;
		x = 22848;
		y = 2816;
	}
	break;
	case "room_lvl4": {
		//TODO: add spawnpoint
	}
	break;
}

// Set initial variables
image_xscale = 1.33;
image_yscale = 1.33;
current_level = room;
hspd = 0;
vspd = 0;
grav = 0.3;
spd = 4;
sprint = 1;
sprint_time = 1;
allow_sprint = false;
player_sprinting = false;
slow_block_multiplier = 1;
player_health = global.player_health;
player_energy = global.player_energy;
player_charge_rate = 1;
invincibility_frames = 0;
player_on_ground = true;
player_on_platform = false;
player_on_slow_block = false;
player_touching_enemy = false;
player_touching_spike = false;
player_alive = true;
player_infinite_energy = false;
full_health_multipler = 1;
player_facing = 1;
gun_facing = 1;
level_complete = true;
footstep_timer = 0;
developer_mode = false;
show_hint = 0;
audio_on = true;
soundfx_on = true;
music_on = global.music_on;
soundfx_vol = 1;
music_vol = 1;
show_hints = false;
global.soundfx = 0;
global.music = 1;

if (global.cp_room == room) {
	x = global.cp_x;
	y = global.cp_y;
}

switch (room) {
	case room_lvl1: {
		player_infinite_energy = true
	}
	break;
	case room_lvl2: {
		player_infinite_energy = false;
	}
	break;
	default: {
		player_infinite_energy = false;
	}
}

// Audio initialization
if (!audio_on) {
	soundfx_on = false;
	music_on = false;
}
if (!soundfx_on) {
	soundfx_vol = 0
}
if (!music_on) {
	music_vol = 0;
}
audio_set_master_gain(global.soundfx, soundfx_vol);
audio_set_master_gain(global.music, music_vol);

//TODO: finish/fix audio system