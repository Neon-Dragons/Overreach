if (showing_dialog == true) {
	var text_x = 50;
	var text_y = 18;
	
	//If you want longer dialogue adjust this.
	var height = 128;
	var border = 5;
	var padding = 16;
	var offsetY = 50;
	var guiWdith = display_get_gui_width()
	//height = string_height(current_dialog.message);
	
	
	height += padding * 2;
	text_x = padding * 2;
	
	draw_set_alpha(alpha);
	
	draw_set_color(c_black);
	draw_rectangle(0, offsetY, guiWdith, height, false);
	
	draw_set_color(c_white);
	draw_rectangle(border, border + offsetY,  guiWdith - border, height - border, false);
	
	draw_set_color(c_black);
	draw_rectangle(border * 2, border * 2 + offsetY,  guiWdith - (border * 2), height - (border * 2), false);
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text_ext(text_x, text_y + offsetY, current_dialog.message, 16,  guiWdith - 192);
	
	alpha = lerp(alpha, 1, 0.6);
}

draw_set_alpha(1);