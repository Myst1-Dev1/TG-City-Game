if (!variable_global_exists("nome_jogador")) {
    global.nome_jogador = "";
}

if (keyboard_lastkey >= ord("A") && keyboard_lastkey <= ord("Z") ||
    keyboard_lastkey >= ord("a") && keyboard_lastkey <= ord("z") ||
    keyboard_lastkey >= ord("0") && keyboard_lastkey <= ord("9") ||
    keyboard_lastkey == vk_space) {

    if (string_length(global.nome_jogador) < 16) {
        global.nome_jogador += chr(keyboard_lastkey);
    }
}

// Backspace para apagar
if (keyboard_lastkey == vk_backspace) {
    if (string_length(global.nome_jogador) > 0) {
        global.nome_jogador = string_copy(global.nome_jogador, 1, string_length(global.nome_jogador) - 1);

    }
}