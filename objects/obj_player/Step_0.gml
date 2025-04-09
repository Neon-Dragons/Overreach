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
if (place_meeting(x + hsp, y, obj_surface)) {
    while (!place_meeting(x + sign(hsp), y, obj_surface)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// ============================
// === VERTICAL COLLISION ====
// ============================
if (place_meeting(x, y + vsp, obj_surface)) {
    while (!place_meeting(x, y + sign(vsp), obj_surface)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// ============================
// === GROUND CHECK ==========
// ============================
grounded = place_meeting(x, y + 1, obj_surface);

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
if (keyboard_check_pressed(ord("1"))) {
    weapon_mode = "melee";
}
if (keyboard_check_pressed(ord("2"))) {
    weapon_mode = "ranged";
}

// ============================
// === MELEE ATTACK =========
// ============================
if (weapon_mode == "melee" && keyboard_check_pressed(ord("X"))) {
    var x_offset = facing * 16;
    var y_offset = -sprite_height / 2;
    var hit = instance_create_layer(x + x_offset, y + y_offset, layer, obj_melee_hitbox);
    hit.image_xscale = facing;
}

// ============================
// === RANGED ATTACK =========
// ============================
if (weapon_mode == "ranged" && keyboard_check_pressed(ord("X"))) {
    var b = instance_create_layer(x + facing * 12, y - 8, layer, obj_bullet);
    b.image_xscale = facing;
}

// ============================
// === GAME OVER ON 0 HP =====
// ============================
if (hp <= 0 && global.game_state != "gameover") {
    global.game_state = "gameover";
    show_debug_message("Player died from HP loss!");
}

with (obj_death) {
    if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom,
                               other.bbox_left, other.bbox_top, other.bbox_right, other.bbox_bottom)) {
        global.game_state = "gameover";
        show_debug_message("Fell into custom death zone!");
    }
}

