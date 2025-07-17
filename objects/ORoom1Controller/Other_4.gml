// Garante que a aleatoriedade mude a cada vez que entrar na room
randomize();

// Limites da área permitida para reposicionar
var min_x = 32;
var max_x = room_width - 32;
var min_y = 32;
var max_y = room_height - 32;

// Número de tentativas por objeto
var attempts = 10;

// Reposiciona os OOrange
with (OOrange) {
    var tries = 0;
    while (tries < attempts) {
        var new_x = irandom_range(min_x, max_x);
        var new_y = irandom_range(min_y, max_y);

        if (!position_meeting(new_x, new_y, OParede) && !position_meeting(new_x, new_y, ONPCBase)) {
		    x = new_x;
		    y = new_y;
		    break;
		}
        tries++;
    }
}

// Reposiciona os OCloudChurch
with (OCloudChurch) {
    var tries = 0;
    while (tries < attempts) {
        var new_x = irandom_range(min_x, max_x);
        var new_y = irandom_range(min_y, max_y);

        if (!position_meeting(new_x, new_y, OParede)) {
            x = new_x;
            y = new_y;
            break;
        }
        tries++;
    }
}
