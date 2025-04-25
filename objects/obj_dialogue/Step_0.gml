
var button_next = 0;

if (!showing_dialog) {
    if (dialog.count() <= 0) {
        instance_destroy();
        obj_player.inTrigger = false;
        
        // Only unpause when dialogue ends
        global.game_paused = false;
		global.game_state = "playing";
        return;
    }

    // Pause the game when dialogue starts
    global.game_paused = true;

    current_dialog = dialog.pop();
    showing_dialog = true;
} else {
	
	if (global.game_state == "scene") {
	    if (keyboard_check_released(key_next)) {
	        showing_dialog = false;
	        alpha = 0;
	    }	
	}
	else {
		timer--
		if (timer <= 0) {
	        showing_dialog = false;
			timer = 160;
		}
	}
}
