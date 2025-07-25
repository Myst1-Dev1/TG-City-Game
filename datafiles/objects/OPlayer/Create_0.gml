window_set_size(1280, 720);

ultima_opcao = 0;

//global.total_laranjas = instance_number(OOrange);
orange=0;
direcao = "baixo";
items_coletaveis = 0;
pode_interagir = false;
mostrar_fala = false;
fase_dialogo = 0;
fala_velocidade = 2;
opcao_selecionada = 0;
npc_em_foco = noone;
fala_atual = "";
fala_renderizada = "";
fala_indice = 0;
fala_timer = 0;
pode_mover = true;

falou_com_npc = false;

indo_para_porta = false;
destino_x = x;
destino_y = y;
transicao_ativada = false;
transicao_timer = 0;

if (!variable_global_exists("game_timer")) {
    global.game_timer = 0; // tempo em frames
}

global.game_timer += 1;

if (!variable_global_exists("orange")) {
    global.orange = 0;
}

//em_transicao = false; // se está saindo pela porta
//velocidade_saida = 2; // velocidade de saída automática
//destino_saida_x = x;
//destino_saida_y = y;