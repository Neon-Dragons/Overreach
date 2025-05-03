if (show_controls) {
    x = 20;
    y = 20;
    var lh = 22;
	
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);

    draw_set_alpha(0.5);
    draw_set_color(c_black);
    draw_rectangle(10, 10, 400, y + lh * 8, false);
    draw_set_alpha(1);
    draw_set_color(c_white);

    draw_text(x, y, "CONTROLS:");
    y += lh;
    draw_text(x, y, "A / D - Move Left / Right");
    y += lh;
    draw_text(x, y, "S - Crouch (Double Damage)");
    y += lh;
    draw_text(x, y, "Space - Jump / Advance Dialogue");
    y += lh;
    draw_text(x, y, "Q - Swap Weapons");
    y += lh;
    draw_text(x, y, "F - Use Weapon (Can Deflect Bullets)");
    y += lh;
    draw_text(x, y, "Left Ctrl (Hold) + Mouse - Aim");
    y += lh;
    draw_text(x, y, "W - Hold / Release Elara");
}
