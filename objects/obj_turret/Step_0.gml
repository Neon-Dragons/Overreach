if (hp <= 0) {
    instance_destroy();
    exit;
}




if (instance_exists(obj_player)) {
    var player = instance_nearest(x, y, obj_player); // safest way to get position
	var dist = point_distance(x, y, player.x, player.y);
    if (distance_to_object(player) < detectionRange) {

        timer--;
        if (timer <= 0) {

			
			if (distance_to_object(player) <= sightRange) {
			audio_play_sound(snd_machine_gun ,1,false)

            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_turret);
			
            var angle = point_direction(x, y, player.x, player.y);
            bullet.direction = angle;
			}
            timer = 8;
        }
    }
}