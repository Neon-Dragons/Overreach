if !battleStarted
	return;
	
// ============================
// === SMOOTH HP INTERPOLATION ===
// ============================
display_hp = lerp(display_hp, hp, 0.1);


//Normal Boss AI
if (currentHealthState == CurrentHealth.Normal) {
	if ((hp / max_hp) <= 0.50)
		currentHealthState = CurrentHealth.Weakened;
	
	if (currentAttackMode == currentAttackMode.Kinetic) {

	        var player = instance_nearest(x, y, obj_player);
	        var dist = point_distance(x, y, player.x, player.y);
            // === Shooting Logic ===
            timer--;
            if (timer <= 0) {
                if (dist <= sightRange) {
                    audio_play_sound(snd_gunshot, 1, false);
                    var bullet = instance_create_layer(x, y, "Instances", obj_bullet_elektra);

                    var angle = point_direction(x, y, player.x, player.y);

                    // Add variation or spread
                    if (angle < 270 && angle > 90)
                        bullet.direction = angle - 5;
                    else
                        bullet.direction = angle + 5;
                }

                timer = 100;
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