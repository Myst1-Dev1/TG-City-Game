var perto = point_distance(x, y, OPlayer.x, OPlayer.y) < 32;

// manter mensagem visível temporariamente
if (tempo_msg > 0) {
    tempo_msg--;
    if (tempo_msg == 0) {
        mensagem_topo = "";
    }
}

// mostra interação se perto e não está no menu
mostrar_interacao = (perto && estado_confirmacao == 0);

// BLOQUEAR movimento do player durante a confirmação
if (instance_exists(OPlayer)) {
    OPlayer.pode_mover = (estado_confirmacao == 0);
}

// Etapa 0: interação inicial
if (perto && keyboard_check_pressed(ord("E"))) {
   if (estado_confirmacao == 0) {
	    if (OPlayer.orange >= global.total_laranjas && OPlayer.falou_com_npc) {
	        estado_confirmacao = 2; // pula direto para navegação
	        opcao_sim = true;
	    } else {
	        mensagem_topo = "Você não completou todos os objetivos.";
	        tempo_msg = 120; // 2 segundos
	    }
	}

    // Etapa 2: escolher Sim ou Não
    else if (estado_confirmacao == 2) {
        if (opcao_sim) {
	    estado_confirmacao = 3; // novo estado: executando animação
	    opcao_sim = true;

	    // Troca visual da porta
	    instance_create_layer(x, y, layer_get_name(layer), OPortalAberto);
	    instance_destroy(); // remove a porta fechada

	    // Comanda o player para andar até a porta
	    with (OPlayer) {
	        pode_mover = false;
	        indo_para_porta = true;
	        destino_x = other.x;
	        destino_y = other.y;
	    }
	} else {
            estado_confirmacao = 0;
        }
    }
}

// Navegação nas opções (fora do if(E), para funcionar continuamente)
if (estado_confirmacao == 2) {
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right)) {
        opcao_sim = !opcao_sim;
    }
}