// Initialize checkpoints
global.checkpoint = noone;
global.cp_room = 0;
global.cp_x = 0;
global.cp_y = 0;
global.player_health = 100;
global.player_energy = 0;

// Initialize audio system
global.music_on = true;

// Load menu
//room_goto_next();
room_goto(room_lvl4);