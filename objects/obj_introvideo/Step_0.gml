// Skip with a key press
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    audio_stop_sound(snd_introvideo);
    room_goto(rm_main_menu); // Or room_goto(RoomName);
}

// Go to next room when sound finishes
if (!audio_is_playing(snd_introvideo)) {
    room_goto(rm_main_menu);
}
