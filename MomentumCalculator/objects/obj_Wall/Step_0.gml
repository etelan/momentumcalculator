/// @description Debug Output

if (real(velocity) > 4.1){
	show_debug_message("------------------------");
	show_debug_message("mass: " + string(mass));
	show_debug_message("velocity: " + string(velocity));
	momentum = mass * velocity;
	show_debug_message("force: " + string(momentum));
	show_debug_message("------------------------");
}