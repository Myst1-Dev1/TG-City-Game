var sprite_w = sprite_get_width(SRoom1Title);
var sprite_h = sprite_get_height(SRoom1Title);

var pos_x = display_get_gui_width() / 2;
var pos_y = display_get_gui_height() / 2;

draw_set_alpha(alpha);
draw_sprite(sprite_para_usar, 0, pos_x - sprite_w / 2, pos_y - sprite_h / 2);
draw_set_alpha(1);