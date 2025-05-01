// Movement
hsp = 0;
vsp = 0;
grv = 0.5;
jmp = -10;
walksp = 4;
sneaksp = 2;

// State
facing = 1;
grounded = false;
is_ducking = false;
is_sneaking = false;

// Health
hp = 100;
max_hp = 100;
display_hp = max_hp;
heal_rate = 10;
last_hit_time = 0;
weapon_mode = "ranged"; // "melee" or "ranged"
obj_ui.playerWeapon = spr_gun;
if (global.pending_load) {
    x = global.load_x;
    y = global.load_y;
    global.pending_load = false;
}
last_hit_time = 0;
elena = instance_find(obj_elena, 0);
