instance_destroy();
var it;
it = instance_create_depth(owner.x,owner.y,0,Obj_reyna_sword);
it.dmg = owner.dmg;
it.team = owner.team;
it.owner = owner;
it.num = num;
it.alarm[1] = 180;