/// @description Set the size and the speed.

// Initial size!
image_xscale = obj_Player.image_xscale / 10;
image_yscale = obj_Player.image_yscale / 10;

// Initial speed!
vspeed = 3;

// Going left or right?
if (obj_Player.x > x ) {
	hspeed = -hsp;
} else {
	hspeed = +hsp;
}
