// --- HUD FIXA NO TOPO DIREITO COM SPRITE "SScore" ---

//var margem = -15;
var scale = 0.1;
//var score_sprite_width = sprite_get_width(SScore) * scale;
//var score_sprite_height = sprite_get_height(SScore) * scale;

//var pos_x = display_get_gui_width() - margem - score_sprite_width - 20;
//var pos_y = margem;

//draw_sprite_ext(SScore, 0, pos_x, pos_y, scale, scale, 0, c_white, 1);

// Contagem de laranjas
// HUD da laranja no canto superior direito estilo "moeda do Mario"
//var margemO = 80;
//var scaleO = 2;
//var icon_width = sprite_get_width(SOrange) * scaleO;
//var icon_height = sprite_get_height(SOrange) * scaleO;

//var icon_x = display_get_gui_width() - margem - icon_width - 112; // reserva espaço pro número
//var icon_y = margemO;

////// Desenha o ícone da laranja
//draw_sprite_ext(SOrange, 0, icon_x, icon_y, scaleO, scaleO, 0, c_white, 1);

////// Alinhar número no centro vertical do ícone
//draw_set_halign(fa_left);
//draw_set_valign(fa_middle);
//draw_set_font(Pixel);
//draw_set_color(c_white);
//draw_text(icon_x + 25, icon_y, string(global.orange));

// HUD de progresso do item para desbloquear história

if (variable_global_exists("item_coletavel") && variable_global_exists("item_qtt") && variable_global_exists("iconMX") && variable_global_exists("iconMY")) {
	
	var margemX = global.iconMX;
    var margemY = global.iconMY;
    var scaleI = 1.5;

    var icon = global.item_coletavel;
    var icon_w = sprite_get_width(icon) * scaleI;
    var icon_h = sprite_get_height(icon) * scaleI;

    // Posição do ícone
    var icon_xI = margemX;
    var icon_yI = margemY;

    // Desenha o ícone do item coletável
    draw_sprite_ext(icon, 0, icon_xI, icon_yI, scale, scale, 0, c_white, 1);

    // Número coletado
    var qtd_coletado = 0;
    if (variable_global_exists("item_pego")) {
        qtd_coletado = global.item_pego;
    }

    // Desenha o texto "X / Y"
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_font(Pixel); // ou Arial, etc.

    draw_text(40 + 30, 35, string(qtd_coletado) + " / " + string(global.item_qtt));
}

// --- CRONÔMETRO NO TOPO CENTRAL ---
if (variable_global_exists("game_timer")) {
    var tempo_segundos = global.game_timer div room_speed;

    var minutos = tempo_segundos div 60;
    var segundos = tempo_segundos mod 60;

    var min_str = string(minutos);
    if (minutos < 10) min_str = "0" + min_str;

    var seg_str = string(segundos);
    if (segundos < 10) seg_str = "0" + seg_str;

    var tempo_formatado = min_str + ":" + seg_str;

    // Configurações de fonte
    draw_set_font(Pixel);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle); // melhor centralização vertical do texto
    draw_set_color(c_white);

    // Posição do centro
    var xb = display_get_gui_width() / 2;
    var yb = 30;

    // Medidas do retângulo
    var margem_x = 12;
    var margem_y = 6;
    var texto_largura = string_width(tempo_formatado);
    var texto_altura = string_height(tempo_formatado);

    var box_left   = xb - texto_largura / 2 - margem_x;
    var box_top    = yb - texto_altura / 2 - margem_y;
    var box_right  = xb + texto_largura / 2 + margem_x;
    var box_bottom = yb + texto_altura / 2 + margem_y;

    // Desenhar fundo branco
    draw_set_color(c_black);
    draw_rectangle(box_left, box_top, box_right, box_bottom, false);

    // Desenhar borda cinza
    draw_set_color(c_white);
    draw_rectangle(box_left, box_top, box_right, box_bottom, true);

    // Desenhar o tempo
    draw_set_color(c_white);
    draw_text(xb, yb, tempo_formatado);
}

// Interação inicial
var espaco_linha = 40

if (pode_interagir && !mostrar_fala) {
    var ret_x = 0;
    var ret_y = 0;
    var ret_width = display_get_gui_width();
    var ret_height = 80;

    draw_set_color(c_white);
    draw_rectangle(ret_x, ret_y, ret_x + ret_width, ret_y + ret_height, false);

    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(Arial);
    draw_text(display_get_gui_width() / 2, ret_y + ret_height / 2, "Pressione [E] para falar");
}

// Caixa de diálogo
if (mostrar_fala) {
    draw_set_font(Arial);

    var padding = 20;
    var ret_x = padding;
    var ret_y = 0;
    var ret_width = display_get_gui_width() - (padding * 2);
    var ret_height = 200;

    draw_set_color(c_white);
    draw_rectangle(ret_x - padding, ret_y, ret_x + ret_width + padding, ret_y + ret_height, false);

    if (npc_em_foco != noone && npc_em_foco.object_index != OCar) {
        draw_set_color(c_gray);
        draw_set_halign(fa_center);
        draw_text(display_get_gui_width() / 2, ret_y + 10, npc_em_foco.nome_npc);

        draw_set_color(c_black);
        draw_set_halign(fa_left);
        draw_text_ext(ret_x, ret_y + 40 + espaco_linha, fala_renderizada, 24, ret_width);
    }

    // Instruções de controle
    draw_set_color(c_blue);
    if (fase_dialogo == 0) {
        draw_text(ret_x + 10, ret_y + ret_height - 20, "[E] Ver opções");
    } else if (fase_dialogo == 1) {
        draw_text(ret_x + 10, ret_y + ret_height - 20, "[X] Fechar");
		draw_text(ret_x + 200, ret_y + ret_height - 20, "[P] Pressione para pular");
    } else if (fase_dialogo == 2 && parte_historia < array_length(npc_em_foco.historia) - 1) {
        draw_text(ret_x + 10, ret_y + ret_height - 20, "[E] Pressione para avançar");
		draw_text(ret_x + 300, ret_y + ret_height - 20, "[P] Pressione para pular");
    } else {
        draw_text(ret_x + 10, ret_y + ret_height - 20, "[E] Fechar");
		draw_text(ret_x + 300, ret_y + ret_height - 20, "[P] Pressione para pular");
    }
}