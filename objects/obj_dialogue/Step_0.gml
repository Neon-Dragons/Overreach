
var button_next = 0;

if (!showing_dialog) {
    if (dialog.count() <= 0) {
        instance_destroy();
        obj_player.inTrigger = false;
        
        // Only unpause when dialogue ends
        global.game_paused = false;
        return;
    }

    // Pause the game when dialogue starts
    global.game_paused = true;

    current_dialog = dialog.pop();
    showing_dialog = true;
} else {
	timer--
	if (timer <= 0) {
        showing_dialog = false;
		timer = 160;
	}
}
