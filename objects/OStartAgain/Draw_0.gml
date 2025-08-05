if (!visible) exit; // não desenha nada se estiver invisível

fade_alpha += 0.02;
if (fade_alpha > 1) fade_alpha = 1;

draw_set_alpha(fade_alpha);
draw_self();
draw_set_alpha(1);