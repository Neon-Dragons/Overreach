if (obj_ui.foundElena) {
	if (instance_exists(obj_elena)) {
		if (obj_elena.currentState == States.Grabbed)
			room_goto_next();
	}
}
else
	room_goto_next();