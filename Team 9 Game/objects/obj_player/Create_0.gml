// Set initial position
// test level spawn point
x = 64;
y = room_height - 160;
// rocket level spawn point
//x = 160;
//y = 256;
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
music_on = true;

// Play music
switch (room_get_name(room)) {
	case "room_menu": {
		//TODO:	title theme
	}
	break;
	case "room_test1": {
		//TODO: add delay
		if (music_on && !audio_is_playing(audio_music_1)) {
			audio_play_sound(audio_music_1, 1, 0);
		}
	}
	break;
}