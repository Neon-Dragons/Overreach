// Damage the enemy
if obj_player.is_ducking
	other.hp -= bullet_damage * 2;
else
	other.hp -= bullet_damage;

// Optional: red flash effect
other.image_blend = c_red;

// Bullet disappears
instance_destroy();
