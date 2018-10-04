// Draw health bar
draw_sprite_stretched(spr_health_token, 0, view_xport[0] + 22, view_yport[0] + 64, 32, 32);
if (obj_player.player_health >= 0) {
	draw_healthbar(view_xport[0] + 64, view_yport[0] + 64, (view_xport[0] + 384), view_yport[0] + 96, draw_health, c_black, c_red, c_red, 0, true, false);
}

// Draw energy bar
draw_sprite_stretched(spr_energy_token, 0, view_xport[0] + 598, view_yport[0] + 64, 32, 32);
draw_healthbar(view_xport[0] + 640, view_yport[0] + 64, (view_xport[0] + 960), view_yport[0] + 96, draw_energy, c_black, c_blue, c_blue, 0, true, false);

// Draw player hints
draw_set_color(c_black);
draw_set_font(fnt_ui_small);
draw_set_halign(fa_center);
draw_text(view_xport[0] + 512, view_yport[0] + 128, string(hint));