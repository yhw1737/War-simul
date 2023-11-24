with(Obj_Unitpar)
{
	draw_set_colour(c_black);
	draw_set_alpha(0.4);
	draw_ellipse(x-width,y+5-width/3,x+width/2,y+5+width/3,false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
}
with(Obj_arrow)
{
	if image_index == 0 {
		draw_sprite_ext(sprite_index,0,x,y,1,1,point_direction(x,y,x_t,y_t),c_black,0.4);
	}
}