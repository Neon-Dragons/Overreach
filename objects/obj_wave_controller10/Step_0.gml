// === Don't do anything unless the game is active ===
if (global.game_state != "playing") exit;
if (!wave_triggered) return;

// stop waves after limit is reached
if (wave_limit < 0) {
	wave_triggered = false;
	wave_limit = 3;
}
// === Countdown between waves ===
if (!wave_active) {
    spawn_timer -= 1;
    if (spawn_timer <= 0) {
        wave_active = true;
		if (wave_limit != 0) {
			spawn_wave(1, 3000, 3200, 224);
			spawn_wave_drone(0, 600, 700, 32);

		}
		else {
			spawn_wave(3, -640, -10, 448);
		}

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
