// Damage elena
if obj_player.is_ducking
	other.hp -= bullet_damage * 2;
else
	other.hp -= bullet_damage;

// Bullet disappears
instance_destroy();