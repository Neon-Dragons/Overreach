		if (obj_elena.currentState == States.Grabbed) {
			instance_create_layer(x,y,"Instances",obj_dialogue_scene3);
			global.game_state = "scene";
			instance_destroy();
		}
