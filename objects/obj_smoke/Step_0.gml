timer_ticks -= 1;
y -= 2;
image_alpha -= 0.05;
image_xscale += 0.25;
image_yscale = image_xscale;

if (timer_ticks <= 0)
{
	instance_destroy(id);
}