function spawn_wave_drone(w, startPosition, endPosition, yPosition) {
    var count = 1 + w; // Increase enemy count per wave

    for (var i = 0; i < count; i++) {
        var xx = random_range(startPosition, endPosition);
        var yy = yPosition; // Spawn height – adjust to your layout
        instance_create_layer(xx, yy, "Instances", obj_drone);

    }
}
