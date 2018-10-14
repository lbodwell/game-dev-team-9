waves = ds_list_create();
// [wave, type, spawnpoint, delay]
// 20 per wave, 4 different spawn locations, 5 at each wave (increase each wave?)

// Wave 1
ds_list_add(waves, [0, obj_enemy, 0, 100]);
ds_list_add(waves, [0, obj_enemy, 0, 150]);
ds_list_add(waves, [0, obj_enemy, 0, 200]);
ds_list_add(waves, [0, obj_enemy, 0, 250]);
ds_list_add(waves, [0, obj_enemy, 0, 300]);

ds_list_add(waves, [0, obj_enemy, 1, 100]);
ds_list_add(waves, [0, obj_enemy, 1, 150]);
ds_list_add(waves, [0, obj_enemy, 1, 200]);
ds_list_add(waves, [0, obj_enemy, 1, 250]);
ds_list_add(waves, [0, obj_enemy, 1, 300]);

ds_list_add(waves, [0, obj_enemy, 2, 100]);
ds_list_add(waves, [0, obj_enemy, 2, 150]);
ds_list_add(waves, [0, obj_enemy, 2, 200]);
ds_list_add(waves, [0, obj_enemy, 2, 250]);
ds_list_add(waves, [0, obj_enemy, 2, 300]);

ds_list_add(waves, [0, obj_enemy, 3, 100]);
ds_list_add(waves, [0, obj_enemy, 3, 150]);
ds_list_add(waves, [0, obj_enemy, 3, 200]);
ds_list_add(waves, [0, obj_enemy, 3, 250]);
ds_list_add(waves, [0, obj_enemy, 3, 300]);


// Wave 2

ds_list_add(waves, [1, obj_enemy, 0, 100]);
ds_list_add(waves, [1, obj_enemy, 0, 150]);
ds_list_add(waves, [1, obj_enemy, 0, 200]);
ds_list_add(waves, [1, obj_enemy, 0, 250]);
ds_list_add(waves, [1, obj_enemy, 0, 300]);

ds_list_add(waves, [1, obj_enemy, 1, 100]);
ds_list_add(waves, [1, obj_enemy, 1, 150]);
ds_list_add(waves, [1, obj_enemy, 1, 200]);
ds_list_add(waves, [1, obj_enemy, 1, 250]);
ds_list_add(waves, [1, obj_enemy, 1, 300]);

ds_list_add(waves, [1, obj_enemy, 2, 100]);
ds_list_add(waves, [1, obj_enemy, 2, 150]);
ds_list_add(waves, [1, obj_enemy, 2, 200]);
ds_list_add(waves, [1, obj_enemy, 2, 250]);
ds_list_add(waves, [1, obj_enemy, 2, 300]);

ds_list_add(waves, [1, obj_enemy, 3, 100]);
ds_list_add(waves, [1, obj_enemy, 3, 150]);
ds_list_add(waves, [1, obj_enemy, 3, 200]);
ds_list_add(waves, [1, obj_enemy, 3, 250]);
ds_list_add(waves, [1, obj_enemy, 3, 300]);


// Wave 3

ds_list_add(waves, [2, obj_enemy, 0, 100]);
ds_list_add(waves, [2, obj_enemy, 0, 150]);
ds_list_add(waves, [2, obj_enemy, 0, 200]);
ds_list_add(waves, [2, obj_enemy, 0, 250]);
ds_list_add(waves, [2, obj_enemy, 0, 300]);

ds_list_add(waves, [2, obj_enemy, 1, 100]);
ds_list_add(waves, [2, obj_enemy, 1, 150]);
ds_list_add(waves, [2, obj_enemy, 1, 200]);
ds_list_add(waves, [2, obj_enemy, 1, 250]);
ds_list_add(waves, [2, obj_enemy, 1, 300]);

ds_list_add(waves, [2, obj_enemy, 2, 100]);
ds_list_add(waves, [2, obj_enemy, 2, 150]);
ds_list_add(waves, [2, obj_enemy, 2, 200]);
ds_list_add(waves, [2, obj_enemy, 2, 250]);
ds_list_add(waves, [2, obj_enemy, 2, 300]);

ds_list_add(waves, [2, obj_enemy, 3, 100]);
ds_list_add(waves, [2, obj_enemy, 3, 150]);
ds_list_add(waves, [2, obj_enemy, 3, 200]);
ds_list_add(waves, [2, obj_enemy, 3, 250]);
ds_list_add(waves, [2, obj_enemy, 3, 300]);


spawn[0, 0] = 22816;
//top left x
spawn[0, 1] = 3264;
//top left y
spawn[1, 0] = 23712;
//top right x
spawn[1, 1] = 3328;
//top right y
spawn[2, 0] = 22816;
//bottom left x
spawn[2, 1] = 3712;
//bottom left y
spawn[3, 0] = 23680;
//bottom right x
spawn[3, 1] = 3744;
//bottom right y