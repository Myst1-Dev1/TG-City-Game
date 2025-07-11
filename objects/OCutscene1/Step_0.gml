if (global.cutscene_ativa) {
    cutscene_timer++;

    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);

    // Faz a câmera descer suavemente
    cam_y = lerp(cam_y, y_camera_destino, 0.02);
    camera_set_view_pos(view_camera[0], cam_x, cam_y);

    // Quando estiver perto o suficiente do destino, finaliza a cutscene
    if (abs(cam_y - y_camera_destino) < 1) {
        global.cutscene_ativa = false;
        camera_set_view_target(view_camera[0], OPlayer); // Começa a seguir o player
    }
}