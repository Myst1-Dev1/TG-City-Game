var w = display_get_gui_width();
var h = 100;

// Mensagem de erro (se houver)
if (mensagem_topo != "") {
    draw_set_color(c_white);
	draw_set_font(Arial);
    draw_rectangle(0, 0, w, h, false);

    draw_set_color(c_red);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(w / 2, h / 2, mensagem_topo);
}

// Mensagem de interação
else if (mostrar_interacao && estado_confirmacao == 0) {
    draw_set_color(c_white);
    draw_rectangle(0, 0, w, h, false);

    draw_set_color(c_black);
	draw_set_font(Arial);
    draw_set_halign(fa_center);
    draw_text(w / 2, h / 2, "Pressione [E] para interagir");
}

if (estado_confirmacao == 1 || estado_confirmacao == 2) {
    draw_set_color(c_white);
    draw_rectangle(0, 0, w, h, false);

    draw_set_color(c_black);
    draw_set_font(Arial);
    draw_set_halign(fa_center);

    // Título
    draw_text(w / 2, 25, "Deseja ir para a próxima fase?");

    // Opções
    var txt_sim = opcao_sim ? "> Sim <" : "Sim";
    var txt_nao = opcao_sim ? "Não" : "> Não <";

    draw_text(w / 2 - 50, 60, txt_sim);
    draw_text(w / 2 + 50, 60, txt_nao);
}
