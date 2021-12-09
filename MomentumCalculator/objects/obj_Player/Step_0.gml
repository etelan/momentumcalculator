/// @description Stepping

// Inputs - this will check the keys for button presses everytime.
key_right = keyboard_check(vk_right);
key_left = keyboard_check(vk_left);
key_down = keyboard_check(vk_down);
key_jump = keyboard_check(vk_space);

// Jumping, if we are touching the wall and pressing the jump.
if (place_meeting(x,y+1,obj_Wall)) and (key_jump) {vsp = vsp_jump;}

// Calculate speeds for size.
hsp_walk = 4 / image_xscale;
vsp_jump = -5 / image_xscale;

// Calculate Horizontal Speed (right)
hsp = (key_right - key_left) * hsp_walk;

// Move horizontally
var onepixel = sign(hsp); // workout which way to check (1 or -1)
if (place_meeting(x+hsp,y,obj_Wall)) 
{
	// Check left or right for wall
    while (!place_meeting(x+onepixel,y,obj_Wall)) 
    {
		// Move left or right, the way we checked.
        x = x + onepixel; 
    }
	// Now we are touching the wall, so stop the horizontal.
    hsp = 0;
}
x = x + hsp;

// Vertical Speed (down)
vsp = vsp + grv;

// Fall faster, when holding down.
if (key_down) {
	vsp = vsp + grv * 5;
}

// Move down - same logic as before.
var onepixel = sign(vsp);
if (place_meeting(x,y+vsp,obj_Wall))
{
    while (!place_meeting(x,y+onepixel,obj_Wall))
    {
        y = y + onepixel;
    }
	
	//Update the walls stored values when hit.
	nearest_Wall = instance_nearest(x,y, obj_Wall);
	nearest_Wall.velocity = sqrt(sqr(vsp) + sqr(hsp));
	nearest_Wall.mass = image_xscale;
	
	// Spawn Rocks
	if (canSpawn && (sqrt(sqr(vsp) + sqr(hsp)) > 4.1)) {
		
		// Calculate spawnpoints
		outer = 32 * image_xscale;
		left_pointx = x - outer - 2;
		right_pointx = x + outer + 2;
		pointy = y + outer - (10 * image_yscale);
		
		// Actually spawn
		instance_create_layer(left_pointx, pointy, "Instances", obj_rock);
		instance_create_layer(right_pointx, pointy, "Instances", obj_rock);	
		
		// Cancel spawn
		canSpawn = false;
	}
	
	// Reset velocity
    vsp = 0;
} else {
	// If we aren't touching the wall, we gain the ability to spawn rocks again.
	canSpawn = true;
} 

// Move normally
y = y + vsp;