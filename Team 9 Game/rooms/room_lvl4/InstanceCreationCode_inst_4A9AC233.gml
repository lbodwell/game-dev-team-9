waves = ds_list_create();
// [wave, type, spawnpoint, delay]

// Wave 1
ds_list_add(waves, [0, obj_enemy, 0, 1000]);
ds_list_add(waves, [0, obj_enemy, 0, 1100]);
ds_list_add(waves, [0, obj_enemy, 0, 1200]);
ds_list_add(waves, [0, obj_enemy, 0, 1300]);

ds_list_add(waves, [0, obj_enemy, 1, 1000]);
ds_list_add(waves, [0, obj_enemy, 1, 1100]);
ds_list_add(waves, [0, obj_enemy, 1, 1200]);
ds_list_add(waves, [0, obj_enemy, 1, 1300]);

// Wave 2
ds_list_add(waves, [1, obj_enemy, 0, 700]);
ds_list_add(waves, [1, obj_enemy, 0, 800]);
ds_list_add(waves, [1, obj_enemy, 0, 900]);
ds_list_add(waves, [1, obj_enemy, 0, 1000]);

ds_list_add(waves, [1, obj_enemy, 1, 700]);
ds_list_add(waves, [1, obj_enemy, 1, 800]);
ds_list_add(waves, [1, obj_enemy, 1, 900]);
ds_list_add(waves, [1, obj_enemy, 1, 1000]);


// Wave 3
ds_list_add(waves, [2, obj_enemy, 0, 300]);
ds_list_add(waves, [2, obj_enemy, 0, 400]);
ds_list_add(waves, [2, obj_enemy, 0, 500]);
ds_list_add(waves, [2, obj_enemy, 0, 600]);

ds_list_add(waves, [2, obj_enemy, 1, 300]);
ds_list_add(waves, [2, obj_enemy, 1, 400]);
ds_list_add(waves, [2, obj_enemy, 1, 500]);
ds_list_add(waves, [2, obj_enemy, 1, 600]);


spawn[0, 0] = 96;
//left x
spawn[0, 1] = 416;
//left y
spawn[1, 0] = 1120;
//right x
spawn[1, 1] = 288;
//right y