if pause == false {
	if aa = 0{
		aa = 1;
		speed = speed_;
	}
	if die == 0 {
		if !instance_exists(owner) || owner.die == 1{
			die = 1;
			//friction = 0.02;//friction_ = 0.02;
			sprite_index = spr_reyna_sword_die;
			alarm[0] = 60*sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);
			exit;
		}
		if owner.z == 0 {
			if !instance_exists(owner) || owner.die == 1{
				die = 1;
				//friction = 0.02;//friction_ = 0.02;
				sprite_index = spr_reyna_sword_die;
				alarm[0] = 60*sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);
				exit;
			}
			var inst_;
			inst_ = owner;
			with(Obj_Unitpar){
				if point_distance(other.owner.x,other.owner.y,x,y) <= other.owner.range{
					if team != other.team && die == 0 && z == 0 {
						if inst_ == other.owner {
							inst_ = id;
						}
						else {
							var check;
							check = false;
							for(var i=0;i<ds_list_size(other.att_list);i++) {
								if other.att_list[| i] == id {
									check = true;
								}
							}
							if check == false {
								if point_distance(x,y,other.x,other.y) < point_distance(inst_.x,inst_.y,other.x,other.y){
									inst_ = id;
								}
							}
						}
					}
				}
			}
			if inst_ = owner {
				//friction = 0.02;//friction_ = 0.02;
				speed = 0;
				image_angle += (165-num*50 - image_angle)/30;
				var xx,yy;
				xx = owner.x+lengthdir_x(10,165-num*50);
				yy = owner.y+lengthdir_y(10,165-num*50);
				x+=(xx-x)/30;
				y+=(yy-y)/30;
			}
			else {
				/*
				speed_ += 0.025+0.075/abs(angle_difference(point_direction(x,y,inst_.x,inst_.y),direction));
				if (angle_difference(point_direction(x,y,inst_.x,inst_.y),direction) > 45){
					speed -= 0.1;
				}
				direction += angle_difference(point_direction(x,y,inst_.x,inst_.y),direction)/15;
				*/
				motion_add(point_direction(x,y,inst_.x,inst_.y),0.05);
				speed = clamp(speed,0,2);
				speed_ = speed;
				image_angle = direction;
				//friction_ = 0;
			}
			with(Obj_Unitpar) {
				if point_distance(x,y,other.x,other.y) <= 4 {
					if team != other.team && die == 0 && z == 0 {
						var check;
						check = false;
						for(var i=0;i<ds_list_size(other.att_list);i++) {
							if other.att_list[| i] == id {
								check = true;
							}
						}
						if check == false {
							hp-=other.dmg;
							ds_list_add(other.att_list,id);
						}
					}
				}
			}
			for(var i=0;i<ds_list_size(att_list);i++) {
				var it;
				it = att_list[| i];
				if !instance_exists(it) || it.die == 1 {
					ds_list_delete(att_list,i);
					i--;
					exit;
				}
				if point_distance(x,y,it.x,it.y) > 20{
					ds_list_delete(att_list,i);
					i--;
				}
			}
		}
		else {
			//friction = 0.01;//friction_ = 0.01;
			image_angle += (165-num*50 - image_angle)/30;
			var xx,yy;
			xx = owner.x+lengthdir_x(10,165-num*50);
			yy = owner.y+lengthdir_y(10,165-num*50);
			x+=(xx-x)/30;
			y+=(yy-y)/30;
		}
	}
	/*
	x+=lengthdir_x(speed_,direction);
	y+=lengthdir_y(speed_,direction);
	speed_-=sign(speed_)*min(speed_,friction_);
	*/
}
else {
	speed = 0;
	aa = 0;
}
depth = -y;
/*
vspd_+=grav_;
if vspd_ >= -fvspd_ {
	var inst_;
	inst_ = -4;
	with(Obj_Unitpar){
		if team != other.team && die == 0{
			if inst_ = -4 {
				inst_ = id;
				continue;
			}
			if point_distance(other.x,other.y,inst_.x,inst_.y) > point_distance(other.x,other.y,x,y){
				inst_ = id;
			}
		}
	}
	if inst_ != -4 && point_distance(x,y-3,inst_.x,inst_.y) <= 3 {
		inst_.hp-=dmg;
	}
	instance_destroy();
}
y+=vspd_;
x+=hspd_;
var xx, yy;
xx = lengthdir_x(hspd_,0);
yy = lengthdir_y(vspd_,270);
image_angle = point_direction(0,0,xx,yy);
