//if (!variable_global_exists("nome_jogador")) {
//    global.nome_jogador = "";
//}

//if (keyboard_lastkey >= ord("A") && keyboard_lastkey <= ord("Z") ||
//    keyboard_lastkey >= ord("a") && keyboard_lastkey <= ord("z") ||
//    keyboard_lastkey >= ord("0") && keyboard_lastkey <= ord("9") ||
//    keyboard_lastkey == vk_space) {

//    if (string_length(global.nome_jogador) < 16) {
//        global.nome_jogador += chr(keyboard_lastkey);
//    }
//}

//// Backspace para apagar
//if (keyboard_lastkey == vk_backspace) {
//    if (string_length(global.nome_jogador) > 0) {
//        global.nome_jogador = string_copy(global.nome_jogador, 1, string_length(global.nome_jogador) - 1);

//    }
//}

// Inicializa o nome
if (!variable_global_exists("nome_jogador")) {
    global.nome_jogador = "";
}

// Lida com tecla BACKSPACE manualmente
if (keyboard_check_pressed(vk_backspace)) {
    var len = string_length(global.nome_jogador);
    if (len > 0) {
        global.nome_jogador = string_copy(global.nome_jogador, 1, len - 1);
    }
}

// Atualiza com texto digitado
var novo_caractere = string_copy(keyboard_string, string_length(global.nome_jogador) + 1, 1);

// Só adiciona se for válido e tiver espaço
if (novo_caractere != "" && string_length(global.nome_jogador) < 16) {
    if (ord(novo_caractere) >= 32 && ord(novo_caractere) <= 126) { // faixa visível
        global.nome_jogador += novo_caractere;
    }
}

// Limpa o keyboard_string para evitar duplicação
keyboard_string = global.nome_jogador;