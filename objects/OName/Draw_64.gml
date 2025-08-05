//draw_set_halign(fa_left);
//draw_set_valign(fa_middle);
//draw_set_color(c_black);

//draw_text(x - 12, y + 20, global.nome_jogador);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_black);

// Mostra o nome com cursor piscando
var show_cursor = (current_time div 500) mod 2;
var texto = global.nome_jogador;
if (show_cursor) {
    texto += "|";
}
draw_text(x + 13, y + 17, texto);

// Mensagem de erro se nome já existe
if (variable_global_exists("nome_ja_existe") && global.nome_ja_existe) {
	draw_set_font(ArialError);
    draw_set_color(c_red);
    draw_text(x - 40, y + 80, "Este nome ja foi utilizado.");
}