/// @description Draw the Max

// Setup our drawing stats
draw_set_font(wallfont);
draw_set_color(c_black);


// Draw our max
draw_text(x, y-20, "p: " + string(max_p));
draw_text(x + 400, y-20, "a: " + string(abs(max_v)));
draw_text(x + 800, y-20, "m: " + string(max_m));