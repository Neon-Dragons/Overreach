// Damage the player
if obj_player.is_ducking
	other.hp -= bullet_damage * 2;
else
	other.hp -= bullet_damage;

// Optional: red flash effect


// Bullet disappears
instance_destroy();
