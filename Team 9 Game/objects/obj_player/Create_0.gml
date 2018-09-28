// Set initial position
x = 64;
y = room_height - 160;
/* rocket level spawn point
x = 160;
y = 256;*/
//TODO: spawn player dynamically based on level
image_xscale = 1.33;
image_yscale = 1.33;

// Set initial variables
current_level_index = 0;
hspd = 0;
vspd = 0;
grav = 0.3;
spd = 4;
dash = 1;
dash_time = 1;
allow_dash = false;
player_dashing = false;
player_health = 100;
player_energy = 0;
player_charge_rate = 1;
invincibility_frames = 0;
player_on_ground = true;
player_touching_enemy = false;
player_alive = true;
player_infinite_energy = false;
full_health_multipler = 1;
level_complete = false;
footstep_timer = 0;