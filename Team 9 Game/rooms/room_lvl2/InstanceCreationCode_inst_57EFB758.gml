waves = ds_list_create();
// [wave, type, spawnpoint, delay]
// 20 per wave, 4 different spawn locations, 5 at each wave (increase each wave?)
ds_list_add(waves, [0, obj_enemy, 0, 0]);
ds_list_add(waves, [0, obj_enemy, 0, 50]);
ds_list_add(waves, [0, obj_enemy, 0, 100]);
ds_list_add(waves, [0, obj_enemy, 0, 150]);
ds_list_add(waves, [0, obj_enemy, 0, 200]);
ds_list_add(waves, [0, obj_enemy, 0, 250]);
ds_list_add(waves, [0, obj_enemy, 1, 0]);
ds_list_add(waves, [0, obj_enemy, 1, 50]);
ds_list_add(waves, [0, obj_enemy, 1, 100]);
ds_list_add(waves, [0, obj_enemy, 1, 150]);
ds_list_add(waves, [0, obj_enemy, 1, 200]);
ds_list_add(waves, [0, obj_enemy, 1, 250]);

ds_list_add(waves, [1, obj_enemy, 0, 0]);
ds_list_add(waves, [1, obj_enemy, 0, 50]);
ds_list_add(waves, [1, obj_enemy, 0, 100]);
ds_list_add(waves, [1, obj_enemy, 0, 150]);
ds_list_add(waves, [1, obj_enemy, 0, 200]);
ds_list_add(waves, [1, obj_enemy, 0, 250]);
ds_list_add(waves, [1, obj_enemy, 1, 0]);
ds_list_add(waves, [1, obj_enemy, 1, 50]);
ds_list_add(waves, [1, obj_enemy, 1, 100]);
ds_list_add(waves, [1, obj_enemy, 1, 150]);
ds_list_add(waves, [1, obj_enemy, 1, 200]);
ds_list_add(waves, [1, obj_enemy, 1, 250]);

ds_list_add(waves, [2, obj_enemy, 0, 0]);
ds_list_add(waves, [2, obj_enemy, 0, 50]);
ds_list_add(waves, [2, obj_enemy, 0, 100]);
ds_list_add(waves, [2, obj_enemy, 0, 150]);
ds_list_add(waves, [2, obj_enemy, 0, 200]);
ds_list_add(waves, [2, obj_enemy, 0, 250]);
ds_list_add(waves, [2, obj_enemy, 1, 0]);
ds_list_add(waves, [2, obj_enemy, 1, 50]);
ds_list_add(waves, [2, obj_enemy, 1, 100]);
ds_list_add(waves, [2, obj_enemy, 1, 150]);
ds_list_add(waves, [2, obj_enemy, 1, 200]);
ds_list_add(waves, [2, obj_enemy, 1, 250]);

spawn[0, 0] = 0;
//top left x
spawn[0, 1] = 0;
//top left y
spawn[1, 0] = 0;
//top right x
spawn[1, 1] = 0;
//top right y
spawn[2, 0] = 0;
spawn[2, 1] = 0;
spawn[3, 0] = 0;
spawn[3, 1] = 0;