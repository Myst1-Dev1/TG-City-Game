// Controla o tempo do fade
if (tempo < 30) {
    tempo++;  // Conta até 30 para iniciar o fade
} else if (alpha_transicao < 1) {
    // Aumenta a opacidade até 1 (fade out)
    alpha_transicao += 0.02;
} else {
    // Quando o fade terminar, transita para a sala definida em 'indo_para'
    room_goto(indo_para);
}
