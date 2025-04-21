// === Don't do anything unless the game is active ===
if (global.game_state != "playing") exit;
if (!wave_triggered) return;

// stop waves after limit is reached
if (wave_limit < 0) {
	wave_triggered = false;
	instance_create_layer(x,y,"Instances",obj_dialogue_child1_end);
	wave_limit = 3;
}
// === Countdown between waves ===
if (!wave_active) {
    spawn_timer -= 1;
    if (spawn_timer <= 0) {
        wave_active = true;
        spawn_wave(wave, 2000, 2400);
    }
}
else {
    // === Check if all enemies are dead ===
    if (instance_exists(obj_enemy) == false) {
        wave_active = false;
        wave += 1;
		wave_limit -= 1;
        spawn_timer = break_time;
    }
}
