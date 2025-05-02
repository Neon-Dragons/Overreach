// Damage the player
if obj_player.is_ducking {
	other.hp -= bullet_damage * 2;
	hitCount += 1;
}
else {
	other.hp -= bullet_damage;
	hitCount += 1;
}

// Optional: red flash effect


// Bullet disappears
if hitCount > hitCountLimit
	instance_destroy();
