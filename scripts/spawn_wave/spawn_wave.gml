function spawn_wave(w) {
    var count = 3 + w; // Increase enemy count per wave

    for (var i = 0; i < count; i++) {
        var xx = random_range(100, room_width - 100);
        var yy = 100; // Spawn height – adjust to your layout
        instance_create_layer(xx, yy, "Instances", obj_enemy);
    }
}
