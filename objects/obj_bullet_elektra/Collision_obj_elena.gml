// Damage elena
other.hp -= 10;
hitCount += 1;
// Bullet disappears
if hitCount > hitCountLimit
	instance_destroy();
