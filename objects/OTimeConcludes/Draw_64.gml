// Converte o tempo em frames para minutos e segundos


var tempo_segundos = global.game_timer div room_speed;

    var minutos = tempo_segundos div 60;
    var segundos = tempo_segundos mod 60;

    var min_str = string(minutos);
    if (minutos < 10) min_str = "0" + min_str;

    var seg_str = string(segundos);
    if (segundos < 10) seg_str = "0" + seg_str;

    var tempo_formatado = min_str + ":" + seg_str;


// Define a fonte e a cor (opcional, depende do estilo visual)
draw_set_font(Pixel); // Use sua fonte pixelada, ou remova essa linha se não usar fontes customizadas
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_yellow);

// Desenha o texto ao lado do sprite
draw_text(x, y + 20 , tempo_formatado); // ajusta x + 20 para dar espaço da imagem
