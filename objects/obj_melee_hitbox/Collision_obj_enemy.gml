if (!other.hit_by_melee) {
    other.hp -= 10;
    other.hit_by_melee = true;

    if (other.hp <= 0) {
        instance_destroy(other);
    }
}
