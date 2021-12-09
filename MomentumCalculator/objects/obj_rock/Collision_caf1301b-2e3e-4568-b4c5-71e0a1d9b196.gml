/// @description Bounce once

// First of all, completely flip the vspeed
vspeed = -vspeed;

// This checks, if touching the wall a certain number of times, remove.
touches += 1;
if (touches == max_touches) {
	instance_destroy();	
}