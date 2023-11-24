if unit = -4 {
	with(Obj_Unitpar){
		if point_distance(mouse_x,mouse_y,x,y) <= 10 {
			instance_destroy();
		}
	}
}
else{
	if point_distance(mouse_x,mouse_y,x_x,y_y) > 8 {
		var it;
		switch(unit){
			case 0:
			it = instance_create_depth(mouse_x,mouse_y,0,Obj_swordsman);
			it.team = team;
			break;
			case 1:
			it = instance_create_depth(mouse_x,mouse_y,0,Obj_bowman);
			it.team = team;
			break;
			case 2:
			it = instance_create_depth(mouse_x,mouse_y,0,Obj_lancer);
			it.team = team;
			break;
			case 3:
			it = instance_create_depth(mouse_x,mouse_y,0,Obj_giant);
			it.team = team;
			break;
			case 4:
			it = instance_create_depth(mouse_x,mouse_y,0,Obj_reyna);
			it.team = team;
			break;
		}
		x_x = mouse_x;
		y_y = mouse_y;
	}
}