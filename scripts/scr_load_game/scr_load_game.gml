function scr_load_game() {
    var savefile = "save1.ini";

    if (file_exists(savefile)) {
        ini_open(savefile);

        var px = ini_read_real("player", "x", 0);
        var py = ini_read_real("player", "y", 0);
        var room_name = ini_read_string("meta", "room", "rm_game");

        ini_close();

        global.pending_load = true;
        global.load_x = px;
        global.load_y = py;

        room_goto(asset_get_index(room_name));
    } else {
        show_debug_message("No save file found!");
    }
}
