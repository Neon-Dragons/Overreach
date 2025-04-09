switch (global.game_state) {
    case "menu":
        draw_text(100, 100, "MAIN MENU\n[Enter] Start\n[H] Help\n[Esc] Quit");
        break;

    case "paused":
        draw_text(100, 100, "PAUSE\n[R] Restart\n[S] Save\n[L] Load\n[M] Main Menu\n[Q] Quit");
        break;

    case "gameover":
        draw_text(100, 100, "GAME OVER\n[1] Retry Level\n[2] Restart Game\n[3] Main Menu\n[4] Exit");
        break;
}
