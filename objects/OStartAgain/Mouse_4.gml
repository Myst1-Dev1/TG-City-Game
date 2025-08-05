//// Segurança: garante que nome existe
//if (!variable_global_exists("nome_jogador")) {
//    global.nome_jogador = "SEM_NOME";
//}

//global.nome_ja_existe = false;
//var nome_encontrado = false;

//// Formata o tempo
//var tempo_segundos = global.game_timer div room_speed;

//var minutos = tempo_segundos div 60;
//var segundos = tempo_segundos mod 60;

//var min_str = string(minutos);
//if (minutos < 10) min_str = "0" + min_str;

//var seg_str = string(segundos);
//if (segundos < 10) seg_str = "0" + seg_str;

//var tempo_formatado = min_str + ":" + seg_str;

//// Cria struct com dados do novo jogador
//var novo_dado = {
//    nome: string_replace_all(global.nome_jogador, "|", ""),
//    tempo: tempo_formatado
//};

//// Tenta carregar os dados existentes
//var jogadores;
//if (file_exists("jogador.json")) {
//    var f = file_text_open_read("jogador.json");
//    var conteudo = file_text_read_string(f);
//    file_text_close(f);

//    if (string_length(conteudo) > 0) {
//        var parsed = json_parse(conteudo);
//        if (is_array(parsed)) {
//            jogadores = parsed;
//        } else {
//            jogadores = []; // não era array, cria novo
//        }
//    } else {
//        jogadores = [];
//    }
//} else {
//    jogadores = [];
//}

//if (nome_encontrado) {
//    global.nome_ja_existe = true;
//    exit; // não salva nem continua
//}

//// Adiciona novo jogador ao array
//jogadores[array_length(jogadores)] = novo_dado;

//// Salva no arquivo
//var json_string = json_stringify(jogadores);
//var file = file_text_open_write("jogador.json");
//file_text_write_string(file, json_string);
//file_text_close(file);

//// Debug
//show_debug_message(novo_dado.nome + " | " + novo_dado.tempo);

// Segurança: garante que nome existe
//if (!variable_global_exists("nome_jogador")) {
//    global.nome_jogador = "SEM_NOME";
//}
//global.nome_ja_existe = false; // reset

//var nome_limpo = string_replace_all(global.nome_jogador, "|", "");
//var nome_encontrado = false;

//var jogadores = [];

//if (file_exists("jogador.json")) {
//    var f = file_text_open_read("jogador.json");
//    var conteudo = file_text_read_string(f);
//    file_text_close(f);

//    if (string_length(conteudo) > 0) {
//        try {
//            var parsed = json_parse(conteudo);
//            if (is_array(parsed)) {
//                jogadores = parsed;

//                // Verifica se nome já existe (case-insensitive)
//                for (var i = 0; i < array_length(jogadores); i++) {
//                    if (string_lower(jogadores[i].nome) == string_lower(nome_limpo)) {
//                        nome_encontrado = true;
//                        break;
//                    }
//                }
//            }
//        } catch (e) {
//            jogadores = [];
//        }
//    }
//}

//if (nome_encontrado) {
//    global.nome_ja_existe = true;
//    exit; // não salva nem continua
//}

//// Continua normalmente se o nome não existir
//var tempo_segundos = global.game_timer div room_speed;

//var minutos = tempo_segundos div 60;
//var segundos = tempo_segundos mod 60;

//var min_str = string(minutos);
//if (minutos < 10) min_str = "0" + min_str;

//var seg_str = string(segundos);
//if (segundos < 10) seg_str = "0" + seg_str;

//var tempo_formatado = min_str + ":" + seg_str;

//var novo_dado = {
//    nome: nome_limpo,
//    tempo: tempo_formatado
//};

//jogadores[array_length(jogadores)] = novo_dado;

//// Salva no arquivo
//var json_string = json_stringify(jogadores);
//var file = file_text_open_write("jogador.json");
//file_text_write_string(file, json_string);
//file_text_close(file);

//// debug message
//show_debug_message(novo_dado.nome + " | " + novo_dado.tempo);

//// prossegue com o jogo (mude de sala ou reinicie, etc.)
//var trans = instance_create_layer(0, 0, "Instances", OTransition_fade);
//trans.para_reiniciar = true; // flag especial

room_goto(Room_transicao);
global.game_timer = 0;
global.item_qtt = 0;
game_restart();