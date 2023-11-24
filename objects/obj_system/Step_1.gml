if (real_time <= step_time)
{
    draw_enable_drawevent(true);
	game_set_speed(base_room_speed, gamespeed_fps);
}
else
{
    draw_enable_drawevent(false);
    game_set_speed(fast_room_speed, gamespeed_fps);
}

step_time += base_period;