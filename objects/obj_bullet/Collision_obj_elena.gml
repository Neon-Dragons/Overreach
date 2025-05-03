// Damage elena
if obj_player.is_ducking
	other.hp -= bullet_damage * 2 * obj_player.godgun;
else
	other.hp -= bullet_damage * obj_player.godgun;

// Bullet disappears
instance_destroy();