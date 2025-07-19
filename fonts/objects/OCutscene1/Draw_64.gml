if (global.cutscene_ativa && cutscene_timer < 180) {
    var margem = 40;
    var largura = display_get_gui_width() - margem * 2;
    var altura = 60;

    var ret_x = margem;
    var ret_y = display_get_gui_height() * 0.05;

    // Retângulo branco
    draw_set_color(c_white);
    draw_rectangle(ret_x, ret_y, ret_x + largura, ret_y + altura, false);

    // Texto centralizado
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_set_font(Arial);
    draw_text(display_get_gui_width() / 2, ret_y + altura / 2, "O dia estava calmo na vila...");
}