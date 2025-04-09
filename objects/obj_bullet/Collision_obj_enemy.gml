other.hp -= 10;
if (other.hp <= 0) {
    instance_destroy(other);
}
instance_destroy(); // Bullet disappears on hit
