function Dialogue() constructor {
	
	dialogs = [];
	
	add = function(message) {
		array_push(dialogs, {
			message: message,
		});
	}
	
	pop = function() {
		var temp = array_first(dialogs);
		array_delete(dialogs, 0, 1);
		
		return temp;
	}
	
	count = function() {
		return array_length(dialogs);
	}

}