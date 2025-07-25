if (tempo < 30) {
    tempo++;  // Espera inicial (pré-fade)
}
else if (alpha_transicao < 1) {
    alpha_transicao += 0.02; // Faz o fade
    if (alpha_transicao > 1) alpha_transicao = 1; // Garante limite
}
else {
    if (para_reiniciar) {
        game_restart();
    } else {
        room_goto(indo_para);
    }
}