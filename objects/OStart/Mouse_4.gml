var trans = instance_create_layer(0, 0, "Instances", OTransition_fade);
trans.indo_para = Room1;

audio_play_sound(SStartBtn, 1, false);

show_debug_message("fui clicado");