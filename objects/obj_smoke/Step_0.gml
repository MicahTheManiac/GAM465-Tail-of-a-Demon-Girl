timer_ticks -= 1;
y -= 1;
image_alpha -= 0.05;
image_xscale += 0.1;
image_yscale = image_xscale;

if (timer_ticks <= 0)
{
	instance_destroy(id);
}