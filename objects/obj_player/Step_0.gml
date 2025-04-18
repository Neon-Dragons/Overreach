// ============================
// === EXIT IF NOT PLAYING ===
// ============================
if (global.game_state != "playing") exit;



// ============================
// === SMOOTH HP INTERPOLATION ===
// ============================
display_hp = lerp(display_hp, hp, 0.1);

// ============================
// === INPUT ================
// ============================
var move = 0;
if (keyboard_check(ord("A"))) move -= 1;
if (keyboard_check(ord("D"))) move += 1;

is_ducking = keyboard_check(ord("S")) || keyboard_check(vk_down);
is_sneaking = keyboard_check(vk_shift);

//Collisions
if (place_meeting(x + move, y, obj_enemy) == true) {
	move = 0;
}
if (place_meeting(x + move, y, obj_wall) == true) {
	move= 0;
}
// ============================
// === SPEED + FACING ========
// ============================
var current_speed = is_sneaking ? sneaksp : walksp;
hsp = move * current_speed;

if (move != 0) facing = move;

// ============================
// === GRAVITY + JUMPING ====
// ============================
vsp += grv;

if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_surface) && !is_ducking) {
    vsp = jmp;
}

// ============================
// === HORIZONTAL COLLISION ==
// ============================
// === Horizontal Movement & Collision ===
if (hsp != 0) {
    var sign_h = sign(hsp);
    repeat(abs(hsp)) {
        if (!place_meeting(x + sign_h, y, obj_surface) && !place_meeting(x + sign_h, y, obj_enemy)) {
            x += sign_h;
        } else {
            hsp = 0;
            break;
        }
    }
}

// === Vertical Movement & Collision ===
if (vsp != 0) {
    var sign_v = sign(vsp);
    repeat(abs(vsp)) {
        if (!place_meeting(x, y + sign_v, obj_surface) && !place_meeting(x, y + sign_v, obj_enemy)) {
            y += sign_v;
        } else {
            vsp = 0;
            break;
        }
    }
}

// ============================
// === GROUND CHECK ==========
// ============================
grounded = place_meeting(x, y + 1, obj_surface);


// === CONTACT DAMAGE FROM ENEMY (WITH SOLID COLLISIONS) ===
//if (current_time - last_hit_time > 1000) { // 1 sec i-frames
//    with (obj_enemy) {
//        if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
//                                   other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_bottom)) {
//            other.hp -= 10;
//            other.last_hit_time = current_time;

            // Knockback
//            var knock_dir = sign(other.x - x);
//            other.hsp = 4 * knock_dir;
//        }
//    }
//}

// ============================
// === HEALING IF UNHIT ======
// ============================
if (hp < max_hp && current_time - last_hit_time >= 2000) {
    hp += heal_rate * (delta_time / 1000000); // delta_time = microseconds
    hp = min(hp, max_hp);
}

// ============================
// === SPRITE SWITCHING ======
// ============================
if (is_ducking) {
    sprite_index = spr_player_duck;
}
else if (!grounded) {
    sprite_index = spr_player_idle; // Change to jump sprite if available
}
else if (hsp != 0) {
    sprite_index = spr_player_walk;
}
else {
    sprite_index = spr_player_idle;
}

// ============================
// === WEAPON SWAPPING =======
// ============================
if (keyboard_check_pressed(ord("Q"))) {
    if (weapon_mode == "melee")
		weapon_mode = "ranged"
	else
		weapon_mode = "melee"
}

// ============================
// === MELEE ATTACK =========
// ============================
if (weapon_mode == "melee" && keyboard_check_pressed(ord("F"))) {
	audio_play_sound(snd_melee,1, false)
    var x_offset = facing * 16;
    var y_offset = -sprite_height / 1.5;
    var hit = instance_create_layer(x + x_offset, y + y_offset, layer, obj_melee_hitbox);
    hit.image_xscale = facing;
}

// ============================
// === RANGED ATTACK =========
// ============================
if (weapon_mode == "ranged" && keyboard_check_pressed(ord("F"))) {
	audio_play_sound(snd_gunshot,1,false)
	if (sprite_index == spr_player_duck)
		var b = instance_create_layer(x + facing * 12, y - 20, layer, obj_bullet);
	else
		b = instance_create_layer(x + facing * 12, y - 40, layer, obj_bullet);
    b.image_xscale = facing;

    b.direction = (facing == 1) ? 0 : 180; // Right = 0°, Left = 180°
    b.speed = 24;
}


// ============================
// === GAME OVER ON 0 HP =====
// ============================
if (hp <= 0 && global.game_state != "gameover") {
    global.game_state = "gameover";
    show_debug_message("Player died from HP loss!");
	visible=false;
	
}

with (obj_death) {
    if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
                               other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_bottom)) {
        if (global.game_state != "gameover") {
            global.game_state = "gameover";
            show_debug_message("Player fell into death zone!");
            other.visible = false; // <- this hides the player
        }
    }
}

