if (executando_saida) {
    espera_transicao--;

    if (espera_transicao <= 0) {
        global.proxima_sala = room_next(room);
        room_goto(Room_transicao);
    }
}