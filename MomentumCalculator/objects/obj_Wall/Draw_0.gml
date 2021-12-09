/// @description Draw Scales Values

draw_self();

// Initialize
draw_set_font(wallfont);
draw_set_color(c_white);

// Draw the output
draw_text(x, y-28, "p: " + string(momentum));
draw_text(x + 400, y-28, "v: " + string(abs(obj_Player.vsp)));
draw_text(x + 800, y-28, "m: " + string(mass));