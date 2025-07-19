// Evento Draw de OCar

// Declaração das variáveis de posição e tamanho
var ret_x = 0;  
var ret_y = 0;  // Posição vertical do retângulo
var ret_width = display_get_gui_width();  // Largura total da tela
var ret_height = 130; // Altura do retângulo que vai armazenar o diálogo

// Se o loading estiver sendo mostrado
if (mostrar_loading) {
    if (alpha_loading < 1) {
        alpha_loading += 0.02;  // Aumenta a transparência até atingir 1 (fade in)
    }

    // Desenha o fundo de fade in
    draw_set_color(c_black);  // Cor preta para o fundo
    draw_set_alpha(alpha_loading);  // Define a transparência

    // Desenha o fundo da tela, cobrindo a tela inteira
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    // Desenha o texto de "Carregando..."
    draw_set_color(c_white);  // Cor do texto
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "Carregando...");

    // Resetando a transparência para 1 (opaco) após o desenho
    draw_set_alpha(1);
}

// Se o jogador pode interagir e o diálogo não estiver sendo mostrado
if (pode_interagir && !mostrar_fala && !mostrar_loading) {
    // Desenha a mensagem de interação com o OCar
    draw_set_color(c_white);
    draw_rectangle(ret_x, ret_y, ret_x + ret_width, ret_y + ret_height, false);
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(Arial);
    draw_text(display_get_gui_width() / 2, ret_y + ret_height / 2, "Pressione [E] para interagir");
}

// Se o diálogo estiver ativo e a fase for 99 (laranjas não coletadas)
if (mostrar_fala && fase_dialogo == 99 && !mostrar_loading) {
    // Desenha o fundo do diálogo
    draw_set_color(c_white);
    draw_rectangle(ret_x, ret_y, ret_x + ret_width, ret_y + ret_height, false);
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width() / 2, ret_y + 20, "Você não coletou todas as laranjas!");
}

// Se o diálogo estiver ativo, desenha o diálogo com as opções
if (mostrar_fala && fase_dialogo == 1 && !mostrar_loading) {
    // Desenha o fundo do diálogo
    draw_set_color(c_white);
    draw_rectangle(ret_x, ret_y, ret_x + ret_width, ret_y + ret_height, false);
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_text(display_get_gui_width() / 2, ret_y + 20, "Deseja ir para o próximo cenário?");

    // Opções: Sim e Não
    var opcao_x = ret_x + 20;
    var opcao_y = ret_y + 50;
    var opcao_width = ret_width - 40;
    var opcao_height = 40;

    // Desenha as opções dentro do retângulo branco
    for (var i = 0; i < 2; i++) {
        var cor = (i == opcao_selecionada) ? c_red : c_black;
        draw_set_color(cor);
        draw_text(opcao_x + opcao_width / 2, opcao_y + i * opcao_height + opcao_height / 2, (i == 0) ? "Sim" : "Não");
    }
}

// Desenha a instrução para fechar o diálogo
if (mostrar_fala && (fase_dialogo == 2 || fase_dialogo == 3 || fase_dialogo == 99)) {
    draw_set_color(c_blue);
    draw_text(50, ret_y + ret_height - 20, "[E] Fechar");
}