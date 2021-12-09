/// @description Grow!


if (!(distance_to_object(instance_nearest(x,y,obj_Wall)) < (10)))
{
    image_xscale += growthspd;
	image_yscale += growthspd;
}