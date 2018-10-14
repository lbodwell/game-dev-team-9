if (instance_exists(obj_boss)) {
	draw_health = lerp(draw_health, obj_boss.enemy_health / 5, 0.5);
}