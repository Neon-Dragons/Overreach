if !battleStarted
	return;
if (global.game_state != "playing")
	return;
// ============================
// === SMOOTH HP INTERPOLATION ===
// ============================
display_hp = lerp(display_hp, hp, 0.1);


//Normal Boss AI
if (currentHealthState == CurrentHealth.Normal) {
	if ((hp / max_hp) <= 0.50)
		currentHealthState = CurrentHealth.Weakened;
	globalModeTimer--;
	if (globalModeTimer <= 0) {
		currentAttackMode = AttackMode.Energy
		obj_ui.bossWeapon = spr_energy;
		globalModeTimer = 500;
	}
	if (currentAttackMode == AttackMode.Kinetic) {

	        var player = instance_nearest(x, y, obj_player);
	        var dist = point_distance(x, y, player.x, player.y);
			
			// === Movement ===
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
			}

			// === Shooting Logic (runs regardless of stopping range) ===
			timer--;
			if (timer <= 0) {
			    if (dist <= sightRange) {
			        audio_play_sound(snd_elektra_gun, 1, false);

			        var bullet = instance_create_layer(x, y, "Instances", obj_bullet_elektra);
			        var angle = point_direction(x, y, player.x, player.y);

			        // Optional: Add variation or spread
			        bullet.direction = (angle < 270 && angle > 90) ? angle - 5 : angle + 5;
			    }

			    timer = 76; // 1.27 sec at 60fps
			}
	}
	
	
}

//Half Health
if (currentHealthState == CurrentHealth.Weakened) {
	if ((hp / max_hp) <= 0.25)
		currentHealthState = CurrentHealth.NearDeath;
	
	
	
}

//25% Health
if (currentHealthState == CurrentHealth.NearDeath) {
	
	
	
}