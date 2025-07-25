switch (estado) {
    case "fadein":
        alpha += fade_speed;
        if (alpha >= 1) {
            alpha = 1;
            estado = "espera";
        }
        break;

    case "espera":
        timer += 1;
        if (timer >= room_speed * 2) { // espera 2 segundos
            estado = "fadeout";
        }
        break;

    case "fadeout":
        alpha -= fade_speed;
        if (alpha <= 0) {
            alpha = 0;
            instance_destroy(); // opcional
        }
        break;
}