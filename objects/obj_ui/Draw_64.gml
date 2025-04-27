draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1); // Default font

var draw_x = 100;
var draw_y = 100;
var line_spacing = 4; // Extra spacing between lines
var wrap_width = 400; // Max width before text wraps

switch (global.game_state) {

    case "paused":
        if (global.pause_ui_visible) {
            draw_text_ext(draw_x, draw_y,
                "== PAUSED ==\n" +
                "[R] Restart Level\n" +
                "[S] Save Game\n" +
                "[L] Load Game\n" +
                "[M] Return to Main Menu\n" +
                "[Q] Exit Game\n" +
                "[Esc] Resume",
                -1, line_spacing);
        }
        break;

    case "menu":
        draw_text_ext(draw_x, draw_y,
            "== MAIN MENU ==\n" +
            "[Enter] Start Game\n" +
            "[H] Help (optional)\n" +
            "[Q] or [Esc] Quit Game",
            -1, line_spacing);
        break;

case "gameover":
    draw_text_ext(draw_x, draw_y,
        "== GAME OVER ==\n" +
        "[1] Retry Level\n" +
        "[2] Restart Game\n" +
        "[3] Return to Main Menu\n" +
		"[5] Load Game\n"+
        "[4] Exit Game\n",
        -1, line_spacing);
    break;

}
if (global.feedback_text != "") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(room_width * 0.5, room_height * 0.1, global.feedback_text);
}


if (global.game_state == "playing" && instance_exists(obj_player)) {
    // draw health bar code

    // === HEALTH BAR SETTINGS ===
    var bar_x = 20;
    var bar_y = 20;
    var bar_w = 200;
    var bar_h = 24;
    var margin = 2;

    var hp_actual = obj_player.hp;
    var hp_display = obj_player.display_hp;
    var hp_max = obj_player.max_hp;

    var ratio_actual = hp_actual / hp_max;
    var ratio_display = hp_display / hp_max;

    // === BACKGROUND BAR ===
    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

    // === SMOOTH INTERPOLATED RED ZONE (DAMAGE LAG EFFECT) ===
    draw_set_color(c_red);
    draw_rectangle(bar_x + margin, bar_y + margin,
                   bar_x + (bar_w * ratio_display) - margin,
                   bar_y + bar_h - margin, false);

    // === INSTANT GREEN ZONE (CURRENT HP) ===
    draw_set_color(c_lime);
    draw_rectangle(bar_x + margin, bar_y + margin,
                   bar_x + (bar_w * ratio_actual) - margin,
                   bar_y + bar_h - margin, false);

    // === BORDER ===
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, true);

    // === TEXT ===
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(bar_x + bar_w / 2, bar_y + bar_h / 2,
              "HP: " + string(hp_actual) + " / " + string(hp_max));

    // === NAME TEXT BELOW BAR ===
    draw_set_valign(fa_top); // align text from the top
    draw_text(bar_x + bar_w / 2, bar_y + bar_h + 4, "ALEX CROSS");
	
	//Display current Weapon
    var spr = playerWeapon; 
    var spr_w = sprite_get_width(spr);
    var spr_h = sprite_get_height(spr);

    var spr_x = bar_x + bar_w + 20; 
    var spr_y = bar_y + (bar_h / 2); // vertically center

    draw_sprite(spr, 0, spr_x, spr_y);
}



//ELENA HEALTH
if (global.game_state == "playing" && instance_exists(obj_elena) && foundElena) {
    // draw health bar code

    // === HEALTH BAR SETTINGS ===
    var bar_x = 20;
    var bar_y = 90; // moved 50 pixels down
    var bar_w = 200;
    var bar_h = 24;
    var margin = 2;

    var hp_actual = obj_elena.hp;
    var hp_display = obj_elena.display_hp;
    var hp_max = obj_elena.max_hp;

    var ratio_actual = hp_actual / hp_max;
    var ratio_display = hp_display / hp_max;

    // === BACKGROUND BAR ===
    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

    // === SMOOTH INTERPOLATED RED ZONE (DAMAGE LAG EFFECT) ===
    draw_set_color(c_red);
    draw_rectangle(bar_x + margin, bar_y + margin,
                   bar_x + (bar_w * ratio_display) - margin,
                   bar_y + bar_h - margin, false);

    // === INSTANT GREEN ZONE (CURRENT HP) ===
	draw_set_color(make_color_rgb(255, 105, 180));
	draw_rectangle(bar_x + margin, bar_y + margin,
	               bar_x + (bar_w * ratio_actual) - margin,
	               bar_y + bar_h - margin, false);
    // === BORDER ===
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, true);

    // === TEXT ===
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(bar_x + bar_w / 2, bar_y + bar_h / 2,
              "HP: " + string(hp_actual) + " / " + string(hp_max));

    // === TEXT: PRINCESS ELENA ===
    draw_set_valign(fa_top); // align from top for lower text
    draw_text(bar_x + bar_w / 2, bar_y + bar_h + 4, "PRINCESS ELENA");
}

// DAME ELEKTRA HEALTH
if (global.game_state == "playing" && instance_exists(obj_elektra) && meetBoss) {
    // === HEALTH BAR SETTINGS ===
    var bar_w = 200;
    var bar_h = 24;
    var margin = 2;
    var bar_x = 1920 - bar_w - 20; // 20 pixels from right edge
    var bar_y = 20; // vertical position
       
    var hp_actual = obj_elektra.hp;
	var hp_display = obj_elektra.display_hp;
    var hp_max = obj_elektra.max_hp;

    var ratio_actual = hp_actual / hp_max;
    var ratio_display = hp_display / hp_max;
	
 // === DRAW SPRITE TO LEFT OF BAR ===
    var icon_sprite = bossWeapon; // Make sure this sprite exists
    var icon_x = bar_x - sprite_get_width(icon_sprite) + 15;
    var icon_y = bar_y + (bar_h / 2); // Centered vertically
	
	draw_sprite(icon_sprite, 0, icon_x, icon_y);

    // === BACKGROUND BAR ===
    draw_set_color(make_color_rgb(50, 50, 50));
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

    // === SMOOTH INTERPOLATED RED ZONE (DAMAGE LAG EFFECT) ===
    draw_set_color(c_red);
    draw_rectangle(bar_x + margin, bar_y + margin,
                   bar_x + (bar_w * ratio_display) - margin,
                   bar_y + bar_h - margin, false);

    // === INSTANT BLUE ZONE (CURRENT HP) ===
    draw_set_color(c_blue);
    draw_rectangle(bar_x + margin, bar_y + margin,
                   bar_x + (bar_w * ratio_actual) - margin,
                   bar_y + bar_h - margin, false);

    // === BORDER ===
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, true);

    // === TEXT: DAME ELEKTRA ===
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(bar_x + bar_w / 2, bar_y + bar_h + 4, "DAME ELEKTRA REMINGTON");
	

}