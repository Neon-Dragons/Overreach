if (hp <= 0) {
	audio_play_sound(snd_enemy_death,1,false)
    instance_destroy();
    exit;
}


// Reset image blend if needed
image_blend = c_white;
// === Gravity ===
vsp += 0.5;
if (vsp > 8) vsp = 8;

// === Vertical Movement ===
if (!place_meeting(x, y + vsp, obj_surface)) {
    y += vsp;
} else {
    while (!place_meeting(x, y + sign(vsp), obj_surface)) {
        y += sign(vsp);
    }
    vsp = 0;
}

//Collisions
if (place_meeting(x + vsp, y, obj_player) == true) {
	vsp = 0;
}
if (place_meeting(x - vsp, y, obj_player) == true) {
	vsp = 0;
}

// === Patrol Movement ===
//x += facing * move_speed;

//var front_x = x + facing * 8;
//var is_ground_ahead = place_meeting(front_x, y + 1, obj_surface);
//var is_wall_ahead = place_meeting(front_x, y, obj_surface);
//var is_player_ahead = place_meeting(front_x, y, obj_player);

//if (!is_ground_ahead || is_wall_ahead || is_player_ahead) {
//    facing *= -1;
//}


if (instance_exists(obj_player)) {
    var player = instance_nearest(x, y, obj_player); // safest way to get position
	var dist = point_distance(x, y, player.x, player.y);
    if (distance_to_object(player) < detectionRange) {
		if (distance_to_object(player) >= stoppingRange) {
			if (x < player.x) {
				if (!place_meeting(x + move_speed, y, obj_surface))
					x += move_speed;
				}
				else if (x > player.x) {
				if (!place_meeting(x - move_speed, y, obj_surface))
					x -= move_speed;
				}
			}

        timer--;

        if (timer <= 0) {

			
			if (distance_to_object(player) <= sightRange) {
			audio_play_sound(snd_gunshot,1,false)
            var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
			
            var angle = point_direction(x, y, player.x, player.y);
            bullet.direction = angle - 5;
			}
            timer = 20;
        }
    }
}







image_xscale = facing;


//image_xscale = facing; // Optional: flip sprite
// === Melee Attack ===
if (current_time - last_attack_time > attack_cooldown) {
    if (instance_exists(obj_player)) {
        var dist = point_distance(x, y, obj_player.x, obj_player.y);
        if (dist <= attack_range) {
            with (obj_player) {
                hp -= other.damage;
                last_hit_time = current_time;
                show_debug_message("Player hit by enemy!");
            }

            last_attack_time = current_time;
        }
    }
}
