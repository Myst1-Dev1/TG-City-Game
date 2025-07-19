if (!variable_global_exists("item_pego")) {
    global.item_pego = 0;
}

global.item_pego += 1;

// Toca o som de coleta
audio_play_sound(SPickup, 1, false);

instance_destroy(other); // remove o item da room