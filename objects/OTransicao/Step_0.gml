
alpha_transicao += 0.08;

if (alpha_transicao >= 1) {
    alpha_transicao = 1;

    contador_espera++;
    if (contador_espera > 15) {
        room_goto(global.proxima_sala);
    }
}