draw_self();

if (is_hit)
{
	image_blend = c_red;
}
else
{
	image_blend = c_white;
}

f_draw_text_font(x + 5, y + 5, $"HP: {health_current}\nAI State: {state}\nIs Attacking: {is_attacking}\nCD: {do_attack_cooldown}", 0.5);