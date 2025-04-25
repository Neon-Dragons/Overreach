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