if (shader_flash_timer > 0) {
    shader_set(shd_red_tint);
    
    if (u_flashAmount == -1) {
        u_flashAmount = shader_get_uniform(shd_red_tint, "u_flashAmount");
    }

    var amt = clamp(shader_flash_timer / shader_flash_duration, 0, 1);
    shader_set_uniform_f(u_flashAmount, amt);
    
    draw_self();
    shader_reset();
} else {
    draw_self();
}
