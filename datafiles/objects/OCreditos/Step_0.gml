if (tempo == 0 && indice < array_length(creditos)) {
    array_push(mostrar, {sprite: creditos[indice], alpha: 0});
    indice++;
}

tempo++;
if (tempo >= tempo_entre) tempo = 0;

for (var i = 0; i < array_length(mostrar); i++) {
    if (mostrar[i].alpha < 1) {
        mostrar[i].alpha += 0.02;
        if (mostrar[i].alpha > 1) mostrar[i].alpha = 1;
    }
}