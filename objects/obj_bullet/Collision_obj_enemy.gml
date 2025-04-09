// Damage the enemy
other.hp -= 10;

// Optional: red flash effect
other.image_blend = c_red;

// Bullet disappears
instance_destroy();
