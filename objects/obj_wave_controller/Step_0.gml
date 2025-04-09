// === Don't do anything unless the game is active ===
if (global.game_state != "playing") exit;

// === Countdown between waves ===
if (!wave_active) {
    spawn_timer -= 1;
    if (spawn_timer <= 0) {
        wave_active = true;
        spawn_wave(wave);
    }
}
else {
    // === Check if all enemies are dead ===
    if (instance_exists(obj_enemy) == false) {
        wave_active = false;
        wave += 1;
        spawn_timer = break_time;
    }
}
