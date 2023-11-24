with(Obj_Unitpar)
{
	if die == 0 {
		if team == 0{
			for(var i=0;i<maxhp/20;i++){
				draw_sprite(Spr_bluehealth,1,x-(maxhp/20)+3*i,y-10);
				if (hp > maxhp-(maxhp/20-i)*20) {
				draw_sprite(Spr_bluehealth,0,x-(maxhp/20)+3*i,y-10);
				}
			}
		}
		if team == 1{
			for(var i=0;i<maxhp/20;i++){
				draw_sprite(Spr_redhealth,1,x-(maxhp/20)+3*i,y-10);
				if (hp > maxhp-(maxhp/20-i)*20) {
				draw_sprite(Spr_redhealth,0,x-(maxhp/20)+3*i,y-10);
				}
			}
		}
	}
}
draw_sprite(Spr_team,team,room_width/2,30);
if pause
draw_sprite(Spr_pause,0,room_width/2,55);
if room_speed == 120
draw_sprite(Spr_2x,0,room_width/2,55);
switch(unit){
	case 0:
	draw_sprite(Spr_swordsman_idle,0,room_width/2+3,30);
	break;
	case 1:
	draw_sprite(Spr_bowman_idle,0,room_width/2+3,30);
	break;
	case 2:
	draw_sprite(Spr_lancer_idle,0,room_width/2+3,30);
	break;
	case 3:
	draw_sprite(Spr_giant_idle,0,room_width/2+3,30);
	break;
	case 4:
	draw_sprite(Spr_reyna_idle,0,room_width/2+3,30);
	break;
}
if unit = -4 {
	draw_sprite(Spr_cursor,1,mouse_x,mouse_y);
}
else{
	draw_sprite(Spr_cursor,0,mouse_x,mouse_y);
}
var live,death;
live = array_create(2,0);
death = array_create(2,0);
with(Obj_Unitpar) {
	if die == 0 {
		live[team]++;
	}
	else {
		death[team]++;
	}
}
draw_sprite(Spr_Lives,0,room_width/2+32,20);
for(var i=0;i<string_length(string(live[0]));i++) {
	draw_sprite(Spr_number,real(string_char_at(string(live[0]),i+1)),room_width/2+48+6*i,20)
}
draw_sprite(Spr_Lives,1,room_width/2-32,20);
for(var i=0;i<string_length(string(live[1]));i++) {
	draw_sprite(Spr_number,real(string_char_at(string(live[1]),i+1)),room_width/2-42-6*(string_length(string(live[1])))+6*i,20)
}
draw_sprite(Spr_Deaths,0,room_width/2+32,30);
for(var i=0;i<string_length(string(death[0]));i++) {
	draw_sprite(Spr_number,real(string_char_at(string(death[0]),i+1)),room_width/2+48+6*i,30)
}
draw_sprite(Spr_Deaths,1,room_width/2-32,30);
for(var i=0;i<string_length(string(death[1]));i++) {
	draw_sprite(Spr_number,real(string_char_at(string(death[1]),i+1)),room_width/2-42-6*(string_length(string(death[1])))+6*i,30)
}
