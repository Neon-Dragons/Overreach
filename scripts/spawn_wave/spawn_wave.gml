function spawn_wave(w, startPosition, endPosition) {
    var count = 3 + w; // Increase enemy count per wave

    for (var i = 0; i < count; i++) {
        var xx = random_range(startPosition, endPosition);
        var yy = 470; // Spawn height – adjust to your layout
        instance_create_layer(xx, yy, "Instances", obj_enemy);

    }
}
