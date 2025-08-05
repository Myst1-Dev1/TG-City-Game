//if (keyboard_check_pressed(vk_enter)) {
//    show_debug_message("registrado");
//    fade_out = true;
//}

if(fade_out) {
	if (alpha < 0) {
		alpha -= 0.02; // Diminui aos poucos (ajuste a velocidade como preferir)
	} else {
	    instance_destroy(); // Só destrói após o fade-out
	}
}