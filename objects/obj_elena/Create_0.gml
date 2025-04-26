enum States {

	Grabbed,
	Frightned,
	Idle,
}

grv = 0.5;
jmp = -10;
vsp = 0;
grounded = false;
hp = 100;
max_hp = 100;
display_hp = max_hp;
currentState = States.Idle;
heal_rate = 5;
last_hit_time = 0;