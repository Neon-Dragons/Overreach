// =====================
// === PAUSE TOGGLE ===
// =====================
if (global.pause_toggle_cooldown > 0) {
    global.pause_toggle_cooldown -= 1;
}

if (keyboard_check_pressed(vk_escape) && global.pause_toggle_cooldown <= 0) {
    if (global.game_state == "playing") {
        global.game_state = "paused";
        global.pause_ui_visible = true;
        show_debug_message("PAUSED");
    } 
    else if (global.game_state == "paused") {
        global.game_state = "playing";
        global.pause_ui_visible = false;
        show_debug_message("UNPAUSED");
    }

    global.pause_toggle_cooldown = 15; // debounce delay
}


// ==========================
// === GAME STATE ACTIONS ===
// ==========================
switch (global.game_state) {
    
    // MAIN MENU INPUT
    case "menu":
        if (keyboard_check_pressed(vk_enter)) {
            global.game_state = "playing";
            room_goto(rm_game); // Change to your game room
        }

        if (keyboard_check_pressed(ord("H"))) {
            // Add help screen logic here
        }

        if (keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(vk_escape)) {
            game_end();
        }
        break;

    // PAUSED INPUT
case "paused":
    if (keyboard_check_pressed(ord("R"))) {
        global.game_state = "playing";
        global.pause_ui_visible = false;
        room_restart();
    }

    if (keyboard_check_pressed(ord("S"))) {
        scr_save_game();
        global.feedback_text = "Game Saved";
        global.feedback_timer = 90; // show for 1.5 seconds
        global.pause_ui_visible = false;
        global.game_state = "playing";
    }

    if (keyboard_check_pressed(ord("L"))) {
        scr_load_game();
        global.feedback_text = "Game Loaded";
        global.feedback_timer = 90;
        global.pause_ui_visible = false;
        global.game_state = "playing";
    }

    if (keyboard_check_pressed(ord("M"))) {
        global.game_state = "menu";
        global.pause_ui_visible = false;
        room_goto(rm_main_menu);
    }

    if (keyboard_check_pressed(ord("Q"))) {
        game_end();
    }
    break;

    // GAME OVER INPUT
case "gameover":
    // Retry level
    if (keyboard_check_pressed(ord("1"))) {
        global.game_state = "playing";
        room_restart();
    }

    // Restart game
    if (keyboard_check_pressed(ord("2"))) {
        global.game_state = "playing";
        room_goto(rm_game);
    }

    // Back to Main Menu
    if (keyboard_check_pressed(ord("3"))) {
        global.game_state = "menu";
        room_goto(rm_main_menu);
    }

    // Quit game
    if (keyboard_check_pressed(ord("4"))) {
        game_end();
    }
    break;

}
// === Feedback Timer ===
if (global.feedback_timer > 0) {
    global.feedback_timer -= 1;
    if (global.feedback_timer == 0) {
        global.feedback_text = "";
    }
}
