x += lengthdir_x(speed, direction);

// Destroy if off screen (optional)
if (x < 0 || x > 2900) {
    instance_destroy();
}
if (global.game_state != "playing") exit;
