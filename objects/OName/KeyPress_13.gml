if (keyboard_check_pressed(vk_enter)) {
    show_debug_message("registrado");

    // Ativa fade_out em todos os objetos da interface
    with (OName) fade_out = true;
    with (OInputBox) fade_out = true;
    with (OEnterYourName) fade_out = true;
    with (OTime) fade_out = true;
    with (OCongratulations) fade_out = true;
    with (OTimeConcludes) fade_out = true;
    with (OPressEnterToRegister) fade_out = true;

    // Cria os créditos
    instance_create_layer(x, y, "Instances_2", OCreditos);
	//instance_create_layer(x, y, "Instances_2", OStartAgain);
}
