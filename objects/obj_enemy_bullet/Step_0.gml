// Move forward
x += lengthdir_x(speed, direction);

// Destroy if off-screen
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
