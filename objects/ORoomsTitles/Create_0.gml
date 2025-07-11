alpha = 0;
fade_speed = 0.02; // velocidade de fade in/out
estado = "fadein"; // estados: fadein, espera, fadeout
timer = 0;

// Verifica se a variável global foi definida corretamente
if (variable_global_exists("room_title_sprite")) {
    sprite_para_usar = global.room_title_sprite;
} else {
    sprite_para_usar = noone; // ou algum sprite padrão
}