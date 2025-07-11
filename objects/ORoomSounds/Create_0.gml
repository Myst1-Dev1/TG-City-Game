// Pega o som da fase a partir da variável global definida no NPC
if (variable_global_exists("room_music")) {
    sound_para_usar = global.room_music;
} else {
    sound_para_usar = noone;
}

// Toca a música somente se um som válido foi definido
if (sound_para_usar != noone && !audio_is_playing(sound_para_usar)) {
    audio_stop_all(); // Para evitar sobreposição
    audio_play_sound(sound_para_usar, 1, true); // 1 = prioridade, true = loop
}