/// @description Health Bar

draw_sprite(spr_Healthbarbg, 0, healthbar_x, healthbar_y);
draw_sprite_stretched(spr_HealthBar, 0, healthbar_x, healthbar_y, (global.hp/hp_max) * healthbar_width, healthbar_height);
draw_sprite(spr_Healthbar_Border, 0, healthbar_x, healthbar_y);

