// Segurança: garante que nome existe
if (!variable_global_exists("nome_jogador")) {
    global.nome_jogador = "SEM_NOME";
}

// Formata o tempo
var tempo_segundos = global.game_timer div room_speed;

var minutos = tempo_segundos div 60;
var segundos = tempo_segundos mod 60;

var min_str = string(minutos);
if (minutos < 10) min_str = "0" + min_str;

var seg_str = string(segundos);
if (segundos < 10) seg_str = "0" + seg_str;

var tempo_formatado = min_str + ":" + seg_str;

// Cria struct com dados do novo jogador
var novo_dado = {
    nome: global.nome_jogador,
    tempo: tempo_formatado
};

// Tenta carregar os dados existentes
var jogadores;
if (file_exists("jogador.json")) {
    var f = file_text_open_read("jogador.json");
    var conteudo = file_text_read_string(f);
    file_text_close(f);

    if (string_length(conteudo) > 0) {
        var parsed = json_parse(conteudo);
        if (is_array(parsed)) {
            jogadores = parsed;
        } else {
            jogadores = []; // não era array, cria novo
        }
    } else {
        jogadores = [];
    }
} else {
    jogadores = [];
}

// Adiciona novo jogador ao array
jogadores[array_length(jogadores)] = novo_dado;

// Salva no arquivo
var json_string = json_stringify(jogadores);
var file = file_text_open_write("jogador.json");
file_text_write_string(file, json_string);
file_text_close(file);

// Debug
show_debug_message(novo_dado.nome + " | " + novo_dado.tempo);