//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);

//var base_y = 40;
//var espacamento = 50;

//for (var i = 0; i < array_length(mostrar); i++) {
//    draw_set_alpha(mostrar[i].alpha);
//    draw_sprite(mostrar[i].sprite, 0, x, base_y + i * espacamento);
//}
//draw_set_alpha(1);

// Centralização
var centro_x = display_get_width() / 2;
var pos_y = 40;
var espacamento = 50;

for (var i = 0; i < array_length(mostrar); i++) {
    var dado = mostrar[i];
    var spr = dado.sprite;
    var alpha = dado.alpha;

    var largura = sprite_get_width(spr);
    
    draw_set_alpha(alpha);
    draw_sprite(spr, 0, centro_x - largura / 2, pos_y);
    
    pos_y += espacamento;
}

draw_set_alpha(1);