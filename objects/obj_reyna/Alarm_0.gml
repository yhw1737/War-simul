var it;
for(var i=0;i<4;i++){
	it = instance_create_depth(x,y,0,Obj_reyna_sword);
	it.dmg = att;
	it.team = team;
	it.owner = id;
	it.num = i;
}