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
shader_flash_timer = 0;
shader_flash_duration = 10;
u_flashAmount = shader_get_uniform(shd_red_tint, "u_flashAmount");
blood_system = part_system_create();
blood_type = part_type_create();

part_type_shape(blood_type, pt_shape_pixel);
part_type_size(blood_type, 1, 1, 0, 0);
part_type_color1(blood_type, c_red);
part_type_speed(blood_type, 2, 4, 0, 0);
part_type_direction(blood_type, 0, 360, 0, 0);
part_type_gravity(blood_type, 0.2, 270);
part_type_life(blood_type, 15, 30);
