x += lengthdir_x(speed, direction);

// Destroy if off screen (optional)
if (x < 0 || x > room_width) {
    instance_destroy();
}
if (global.game_state != "playing") exit;
