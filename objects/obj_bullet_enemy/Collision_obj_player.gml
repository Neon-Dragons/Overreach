if (obj_player.is_ducking) {
    other.hp -= bullet_damage * 2;
	part_particles_create(other.blood_system, other.x, other.y, other.blood_type, 15);

} else {
    other.hp -= bullet_damage;
	part_particles_create(other.blood_system, other.x, other.y, other.blood_type, 15);

}

// Trigger red flash effect
other.shader_flash_timer = 10; // or: other.shader_flash_duration;
other.last_hit_time = current_time;

// Bullet disappears
instance_destroy();
