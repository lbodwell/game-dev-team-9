// Set initial position
// Test level spawn point
//x = 64;
//y = room_height - 160;
// Level 2 Spawnpoint
x = 64;
y = 768;
//TODO: spawn player dynamically based on level
image_xscale = 1.33;
image_yscale = 1.33;

// Set initial variables
current_level_index = 0;
hspd = 0;
vspd = 0;
grav = 0.3;
spd = 4;
sprint = 1;
sprint_time = 1;
allow_sprint = false;
player_sprinting = false;
player_health = 100;
player_energy = 0;
player_charge_rate = 1;
invincibility_frames = 0;
player_on_ground = true;
player_on_platform = false;
player_touching_enemy = false;
player_touching_spike = false;
player_alive = true;
player_infinite_energy = false;
full_health_multipler = 1;
level_complete = false;
footstep_timer = 0;
developer_mode = false;
show_hint = 0;
audio_on = true;
soundfx_on = true;
music_on = false;
soundfx_vol = 1;
music_vol = 1;
global.soundfx = 0;
global.music = 1;

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
//if (music_on) {
	switch (room_get_name(room)) {
		case "room_menu": {
			//TODO:	title theme
		}
		break;
		case "room_lvl2": {
			//global.music = audio_play_sound(audio_music_1, 1, 0);
			//TODO: add delay
			if (!audio_is_playing(audio_music_1)) {
				audio_play_sound(audio_music_1, 1, 0);
			}
		}
		break;
	}
//}
//TODO: fix audio system