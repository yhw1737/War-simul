draw_enable_drawevent(false);

randomize();
team = 0;
unit = 0;
x_x = 0;
y_y = 0;
globalvar pause;
pause = false;
depth = -1000;

base_room_speed = room_speed;
fast_room_speed = room_speed * 1.5;

base_period = 1000 / base_room_speed;

real_time = current_time;
step_time = current_time;