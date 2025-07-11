global.cutscene_ativa = true;
cutscene_timer = 0;

var cam_height = camera_get_view_height(view_camera[0]);
var cam_width = camera_get_view_width(view_camera[0]);

// Posição destino (calculada com base no Player)
if (instance_exists(OPlayer)) {
    y_camera_destino = OPlayer.y - cam_height / 2;

    // Limitar destino para não ultrapassar limites da room
    y_camera_destino = clamp(y_camera_destino, 0, room_height - cam_height);

    // Começa um pouco acima do destino
    var y_inicial = y_camera_destino - 100;

    // Limitar início para não ultrapassar o topo
    y_inicial = max(0, y_inicial);

    camera_set_view_pos(view_camera[0], 0, y_inicial);
} else {
    y_camera_destino = 0;
    camera_set_view_pos(view_camera[0], 0, 0);
}