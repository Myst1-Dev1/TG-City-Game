// Evento Step de OCar
// Função iniciar_fala
function iniciar_fala(_texto) {
    fala_atual = _texto;
    fala_renderizada = "";
    fala_indice = 0;
    fala_timer = 0;
}

// Evento Step de OCar

// Verifica a distância entre o OPlayer e o OCar
var player = instance_nearest(x, y, OPlayer);
var npc = instance_nearest(x, y, ONPCBase);

// Depuração: Verifica se o NPC está sendo encontrado corretamente
show_debug_message("NPC encontrado: " + string(npc));

if (npc != noone) { // Garante que o NPC existe antes de acessar suas variáveis
    if (player != noone && point_distance(player.x, player.y, x, y) < 30) {
        pode_interagir = true; // OPlayer pode interagir com o OCar se estiver perto

        if (!mostrar_fala) {  // Só entra aqui se o diálogo não estiver sendo mostrado
            if (keyboard_check_pressed(ord("E"))) {
                if (player.orange < npc.laranjas_necessarias) {
                    // Exibe a mensagem sobre laranjas
                    mostrar_fala = true;
                    iniciar_fala("Você não coletou todas as laranjas!");
                    fase_dialogo = 99; // Fase do diálogo para a mensagem sobre as laranjas
                    opcao_selecionada = 0; // Nenhuma opção a selecionar, apenas mensagem
                    player.pode_mover = false;  // Impede o movimento do jogador até que feche o diálogo
                } else {
                    // Se tiver as laranjas, pergunta se deseja ir para o próximo cenário
                    mostrar_fala = true;
                    iniciar_fala("Deseja ir para o próximo cenário?");
                    fase_dialogo = 1; // Fase do diálogo para opções
                    opcao_selecionada = 0; // Começa com a opção "Sim"
                    player.pode_mover = false;  // Impede o movimento do jogador até que ele escolha uma opção
                }
            }
        }
    } else {
        pode_interagir = false; // Não pode interagir se o OPlayer não estiver perto
    }

    // Fechar o diálogo na fase 99 quando pressionar E (mensagem de erro)
    if (mostrar_fala && fase_dialogo == 99) {
        if (keyboard_check_pressed(ord("E"))) {
            player.pode_mover = true;  // Permite que o jogador se mova novamente
            mostrar_fala = false;  // Fecha o diálogo
        }
    }

    // Navegar entre as opções Sim/Não para avançar (fase 1)
    if (mostrar_fala && fase_dialogo == 1) {
        if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
            opcao_selecionada = 1 - opcao_selecionada; // Alterna entre 0 (Sim) e 1 (Não)
        }

        // Quando pressionado Enter, faz a ação de acordo com a seleção
        if (keyboard_check_pressed(vk_enter)) {
            if (opcao_selecionada == 0) {
                // Se "Sim", começa o tempo de loading
                tempo_loading = 0;  // Inicializa o cronômetro de loading
                mostrar_loading = true;  // Mostra o loading
            } else {
                // Se "Não", apenas fecha o diálogo
                player.pode_mover = true;
                mostrar_fala = false;
            }
        }
    }
}

// No evento Step de OCar (controle do tempo de loading)
if (mostrar_loading) {
    if (tempo_loading < 120) {  // Aproximadamente 2 segundos (se room_speed = 60)
        tempo_loading++;  // Aumenta o tempo de loading
    } else {
        // Quando o tempo de loading passar, faz a transição para a próxima fase
        room_goto_next();  // Vai para a próxima room (Room2)
        mostrar_loading = false;  // Oculta o loading
    }
}