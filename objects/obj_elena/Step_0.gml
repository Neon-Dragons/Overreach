// ============================
// === SMOOTH HP INTERPOLATION ===
// ============================
display_hp = lerp(display_hp, hp, 0.1);

// ============================
// === GAME OVER ON 0 HP =====
// ============================
if (hp <= 0 && global.game_state != "gameover") {
    global.game_state = "gameover";
    show_debug_message("Elena died from HP loss!");
	audio_play_sound(snd_elena_death,1,false)
	visible=false;
	
}

// ============================
// === HEALING IF UNHIT ======
// ============================
if (hp < max_hp && current_time - last_hit_time >= 2000) {
    hp += heal_rate * (delta_time / 1000000); // delta_time = microseconds
    hp = min(hp, max_hp);
}
// ============================
// === GROUND CHECK ==========
// ============================
grounded = place_meeting(x, y + 1, obj_surface);


if (currentState != States.Grabbed) {
	vsp += grv;

	if (vsp != 0) {
	    var sign_v = sign(vsp);
	    repeat(abs(vsp)) {
	        if (!place_meeting(x, y + sign_v, obj_surface)) {
	            y += sign_v;
	        } else {
	            vsp = 0;
	            break;
	        }
	    }
	}
}