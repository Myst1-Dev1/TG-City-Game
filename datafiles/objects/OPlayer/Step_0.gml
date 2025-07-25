function iniciar_fala(_texto) {
    fala_atual = _texto;
    fala_renderizada = "";
    fala_indice = 0;
    fala_timer = 0;
	
	audio_play_sound(STypeWriter, 1, false);
}

if(mostrar_fala = false) {
	audio_stop_sound(STypeWriter);
}

// Movimentação
if (!mostrar_fala && pode_mover) {
    var velocidade = keyboard_check(vk_shift) ? 2.5 : 1;

    var mov_x = 0;
    var mov_y = 0;

    // Checa teclas e define a direção
    if (keyboard_check(vk_right)) {
        mov_x = velocidade;
        direcao = "direita";
    } 
    if (keyboard_check(vk_left)) {
        mov_x = -velocidade;
        direcao = "esquerda";
    }
    if (keyboard_check(vk_down)) {
        mov_y = velocidade;
        direcao = "baixo";
    }
    if (keyboard_check(vk_up)) {
        mov_y = -velocidade;
        direcao = "cima";
    }

    // Movimento com colisão
    if (!place_meeting(x + mov_x, y, OParede) && !place_meeting(x + mov_x, y, ONPCSimples) && !place_meeting(x + mov_x, y, ONPCBase)) {
        x += mov_x;
    }
    if (!place_meeting(x, y + mov_y, OParede) && !place_meeting(x, y + mov_y, ONPCSimples) && !place_meeting(x, y + mov_y, ONPCBase)) {
        y += mov_y;
    }

    // Animação e orientação
    if (mov_x != 0 || mov_y != 0) {
        switch (direcao) {
            case "baixo":
                sprite_index = SPlayerDown;
                image_xscale = 1;
                break;
            case "cima":
                sprite_index = SPlayerUp;
                image_xscale = 1;
                break;
            case "esquerda":
                sprite_index = SPlayerRun;
                image_xscale = -1;
                break;
            case "direita":
                sprite_index = SPlayerRun;
                image_xscale = 1;
                break;
        }
    } else {
        // Personagem parado, mantém a direção
        switch (direcao) {
            case "baixo":
                sprite_index = SPlayer;
                image_xscale = 1;
                break;
            case "cima":
                sprite_index = SPlayerSideUp;
                image_xscale = 1;
                break;
            case "esquerda":
                sprite_index = SPlayerSideLeft;
                image_xscale = 1;
                break;
            case "direita":
                sprite_index = SPlayerSideRight;
                image_xscale = 1;
                break;
        }
    }
}

//
if (mostrar_fala && fase_dialogo != 0) {
    var texto_completo = string_length(fala_atual);

    // Se o texto ainda está sendo digitado
    if (fala_indice < texto_completo) {
        // Se apertar P, pula para o final instantaneamente
        if (keyboard_check_pressed(ord("P"))) {
            fala_indice = texto_completo;
            fala_renderizada = fala_atual;
			audio_stop_sound(STypeWriter);
        } else {
            fala_timer++;
            if (fala_timer >= fala_velocidade) {
                fala_timer = 0;
                fala_indice++;
                fala_renderizada = string_copy(fala_atual, 1, fala_indice);
            }
        }
    }
}

// STEP EVENT do OPlayer
if (!variable_global_exists("game_timer")) {
    global.game_timer = 0;
}

global.game_timer += 1;

// NPC mais próximo
var npc_base = instance_nearest(x, y, ONPCBase);
var npc_simples = instance_nearest(x, y, ONPCSimples);
var npc = noone;

if (npc_base != noone && (npc_simples == noone || point_distance(x, y, npc_base.x, npc_base.y) < point_distance(x, y, npc_simples.x, npc_simples.y))) {
    npc = npc_base;
} else if (npc_simples != noone) {
    npc = npc_simples;
}

// Interação com NPC
if (npc != noone && point_distance(x, y, npc.x, npc.y) < 30) {
    pode_interagir = true;

    if (keyboard_check_pressed(ord("E"))) {
		direcao = "baixo";
		sprite_index = SPlayer;
        if (!mostrar_fala) {
            npc_em_foco = npc;

            if (fase_dialogo == 0) {
                iniciar_fala(npc_em_foco.fala_inicial);
                fase_dialogo = 1;
                mostrar_fala = true;
            }
            else if (fase_dialogo == 1) {
                if (global.item_pego < npc_em_foco.laranjas_necessarias) {
                    iniciar_fala(npc_em_foco.frase_items_imcompletos);
                    mostrar_fala = true;
                } else {
                    fase_dialogo = 2;
                    parte_historia = 0;
                    iniciar_fala(npc_em_foco.historia[parte_historia]);
                    mostrar_fala = true;
                }
            }
        } 
        else {
            if (fase_dialogo == 2 && fala_renderizada == fala_atual) {
                if (parte_historia < array_length(npc_em_foco.historia) - 1) {
                    parte_historia++;
                    iniciar_fala(npc_em_foco.historia[parte_historia]);
                } else {
                    iniciar_fala("História finalizada! Pressione [E] para avançar para a próxima fase.");
                    fase_dialogo = 3;
                }
            } 
            else if (fase_dialogo == 3 && fala_renderizada == fala_atual) {
                mostrar_fala = false;
                room_goto(Room_transicao);
            }
        }
    }

    if (keyboard_check_pressed(ord("X")) && fase_dialogo == 1) {
        mostrar_fala = false;
    }

} else {
    pode_interagir = false;
}

// Impede sair da room
x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);