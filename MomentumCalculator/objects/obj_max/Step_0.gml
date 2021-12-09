/// @description Get new max, every frame.

if (obj_Wall.velocity > max_v) {
	max_v = obj_Wall.velocity;
}

if (obj_Wall.momentum > max_p) {
	max_p = obj_Wall.momentum;
}

if (obj_Wall.mass > max_m) {
	max_m = obj_Wall.mass;
}