// ===================
// === MAIN CHECK ===
// ===================
if (global.game_state == "playing") {

    // === Death Check ===
    if (hp <= 0) {
        audio_play_sound(snd_enemy_death, 1, false);
        instance_destroy();
        exit;
    }

    // === Reset Image Blend ===
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

    // === Collisions with player ===
    if (place_meeting(x + vsp, y, obj_player)) {
        vsp = 0;
    }
    if (place_meeting(x - vsp, y, obj_player)) {
        vsp = 0;
    }
	
	    // === Collisions with elena ===
	if (place_meeting(x - vsp, y, obj_elena) || (place_meeting(x + vsp, y, obj_elena))) {
		
        vsp = 0;
		var elena = instance_nearest(x, y, obj_elena);
        var dist = point_distance(x, y, elena.x, elena.y);
		    timer--;
            if (timer <= 0) {
                if (dist <= sightRange) {
                    audio_play_sound(snd_gunshot, 1, false);
                    var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);

                    var angle = point_direction(x, y, elena.x, elena.y);

                    // Add variation or spread
                    if (angle < 270 && angle > 90)
                        bullet.direction = angle - 5;
                    else
                        bullet.direction = angle + 5;
                }

                timer = 20;
            }
			return;
    }

    // === Enemy Logic ===
    if (instance_exists(obj_player)) {
        var player = instance_nearest(x, y, obj_player);
        var dist = point_distance(x, y, player.x, player.y);
		    var dir = sign(player.x - x);
			if(dir != 0) image_xscale = sign(player.x - x);
        if (dist < detectionRange) {

            // === Basic Left/Right Chasing ===
            if (dist >= stoppingRange) {
                if (x < player.x) {

                    if (!place_meeting(x + move_speed, y, obj_surface)) {
                        x += move_speed;
                    }
                } else if (x > player.x) {
                    if (!place_meeting(x - move_speed, y, obj_surface)) {
                        x -= move_speed;
                    }
                }
            }

            // === Shooting Logic ===
            timer--;
            if (timer <= 0) {
                if (dist <= sightRange) {
                    audio_play_sound(snd_gunshot, 1, false);
                    var bullet = instance_create_layer(x, y, "Instances", obj_bullet_enemy);

                    var angle = point_direction(x, y, player.x, player.y);

                    // Add variation or spread
                    if (angle < 270 && angle > 90)
                        bullet.direction = angle - 5;
                    else
                        bullet.direction = angle + 5;
                }

                timer = 20;
            }
        }
    }

    // === Facing Direction Flip ===
    //image_xscale = facing;

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
}
