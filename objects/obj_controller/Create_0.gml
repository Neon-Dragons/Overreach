// Initial game state
global.game_state = (room == rm_main_menu) ? "menu" : "playing";

// Pause system flags
global.pause_ui_visible = false;
global.pause_toggle_cooldown = 0;
global.pending_load = false;
global.load_x = 0;
global.load_y = 0;

global.feedback_text = "";
global.feedback_timer = 0;
