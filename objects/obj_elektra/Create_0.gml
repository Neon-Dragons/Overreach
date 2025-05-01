//Health States
enum CurrentHealth {
	Normal,
	Weakened,
	NearDeath,
}

//Attack States
enum AttackMode {
	Kinetic,
	Energy,
	EnergyMultiple,
}
// Health
hp = 1500;
max_hp = 1500;
display_hp = max_hp;
currentHealthState = CurrentHealth.Normal;
currentAttackMode = AttackMode.Kinetic;


timer = 0;
bullet_speed = 24;