function scr_save_game() {
    var savefile = "save1.ini";

    ini_open(savefile);

    ini_write_real("player", "x", obj_player.x);
    ini_write_real("player", "y", obj_player.y);

    ini_write_string("meta", "room", room_get_name(room));

    ini_close();

    show_debug_message("Game saved to " + savefile);
}
