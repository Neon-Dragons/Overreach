// === Don't do anything unless the game is active ===
if (global.game_state != "playing") exit;
if (!wave_triggered) return;

// stop waves after limit is reached
if (wave_limit < 0) {
	wave_triggered = false;
	wave_limit = 1;
}
// === Countdown between waves ===
if (!wave_active) {
    spawn_timer -= 1;
    if (spawn_timer <= 0) {
        wave_active = true;
		spawn_wave(wave, -470, -50, 150);
    }
}
else {
    // === Check if all enemies are dead ===
	var found = false;

	with (obj_enemy) {
	    if (object_index == obj_enemy) {
	        found = true;
	    }
	}

	if (!found) {
	    wave_active = false;
	    wave += 1;
	    wave_limit -= 1;
	    spawn_timer = break_time;
	}
}
