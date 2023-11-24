if pause == false{//퍼즈가 아닐 때

	image_speed = 1;
	if z >= 0 {//공격 준비가 완료되었을 
		z = 0;
		if die == 0 {//안 죽었을 때
			if hp <= 0{//체력이 0 이하로 떨어지면
				die = 1;//죽는다
				sprite_index = diesprite;
				image_index = 0;
				alarm_[0] = 60*sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);
				exit;//죽으면 해당 프레임을 스킵
			}
			if k == 0{
				if atdelay = 0 {//공격 중이 아닐 떄
					var inst_;
					inst_ = -4;
					with(Obj_Unitpar){
						if team != other.team && die == 0 && z == 0{
							if inst_ = -4 {
								inst_ = id;
								continue;
							}
							if point_distance(other.x,other.y,inst_.x,inst_.y) > point_distance(other.x,other.y,x,y){
								inst_ = id;
							}
						}
					}
					target = inst_;
					if inst_ == -4{
						sprite_index = idlesprite;
					}
					else{
						target_x = target.x;
						target_y = target.y;
						image_xscale = sign(target_x-x);
						if smart == 0 {
							if point_distance(x,y,inst_.x,inst_.y) > range {
								var dir;
								dir = point_direction(x,y,inst_.x,inst_.y);
								x+=lengthdir_x(spd,dir);
								y+=lengthdir_y(spd,dir);
								image_xscale = sign(inst_.x-x);
								sprite_index = walksprite;
							}
							else {
								sprite_index = attsprite;
								image_index = 0;
								alarm_[0] = 60*sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);
								atdelay = 1;
							}
						}
						if smart == 1 {
							if (inst_.target == id && point_distance(x,y,inst_.x,inst_.y) < range) || point_distance(inst_.x,inst_.y,x,y) <= range/2 {
								var dir;
								dir = point_direction(x,y,inst_.x,inst_.y);
								x-=lengthdir_x(spd,dir);
								y-=lengthdir_y(spd,dir);
								image_xscale = sign(x-inst_.x);
								sprite_index = walksprite;
							}
							else {
								if point_distance(x,y,inst_.x,inst_.y) > range {
									var dir;
									dir = point_direction(x,y,inst_.x,inst_.y);
									x+=lengthdir_x(spd,dir);
									y+=lengthdir_y(spd,dir);
									image_xscale = sign(inst_.x-x);
									sprite_index = walksprite;
								}
								else {
									sprite_index = attsprite;
									image_index = 0;
									alarm_[0] = 60*sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);
									atdelay = 1;
								}
							}
						}
					}
				}
			}
			else {
				sprite_index = knocksprite;
				x+=lengthdir_x(k,knock);
				y+=lengthdir_y(k,knock);
				k-=0.05;
				if k <= 0 {
					knock = 0;
					k = 0;
				}
				alarm_[0] = -1;
				atdelay = 0;
			}
			if sprite_index == attsprite {//공격 중일 때
				if image_index == atindex {
					switch(object_index) {
						case Obj_swordsman :
						if instance_exists(target) {
							if target.die == 0 {
								target.hp-=att;
							}
						}
						break;
						case Obj_bowman :
						if instance_exists(target){
							target_x = target.x;
							target_y = target.y;
						}
						var inst_;
						inst_ = instance_create_depth(x,y,-900,Obj_arrow);
						inst_.x_t = target_x+random_range(-7,7);
						inst_.y_t = target_y+random_range(-2,12);
						inst_.dmg = att;
						inst_.team = team;
						break;
						case Obj_lancer :
						if instance_exists(target) {
							if target.die == 0 {
									target.hp-=att;
							}
							if target.knockable = true {
								var s_;
								s_ = point_direction(x,y,target.x,target.y);
								target.knock = s_;
								target.k = 0.5;
							}
						}
						break;
						case Obj_giant :
						if instance_exists(target) {
							with(Obj_Unitpar){
								if point_distance(x,y,other.target.x,other.target.y) <= 5{
									if team != other.team && die == 0 && z == 0 {
											hp-=other.att;
									}
									if knockable = true {
										var s_;
										s_ = point_direction(other.x,other.y,x,y);
										knock = s_;
										k = 1;
									}
								}
							}
						}
						break;
					}
				}
			}
			if object_index == Obj_giant {
				with(Obj_arrow) {
					if point_distance(x,y+z,other.x,other.y-3) <= 6 && team != other.team{
						other.hp-=dmg/4;
						instance_destroy();
					}
				}
			}
			//충돌 시 서로 밀어내기
			var inst_;
			inst_ = -4;
			with(Obj_Unitpar){
				if team == other.team && die == 0 && id != other.id{
					if inst_ = -4 {
						inst_ = id;
						continue;
					}
					if point_distance(other.x,other.y,inst_.x,inst_.y) > point_distance(other.x,other.y,x,y){
						inst_ = id;
					}
				}
			}
			if inst_ != -4 {
			if point_distance(x,y,inst_.x,inst_.y) <= width/2{
					x+=lengthdir_x(1,point_direction(inst_.x,inst_.y,x,y));
					y+=lengthdir_y(1,point_direction(inst_.x,inst_.y,x,y));
				}
			}
		}
		else {
			if object_index == Obj_giant {
				if image_index == dieindex {
					with(Obj_Unitpar) {
						if point_distance(x,y,other.x,other.y) <= 20 {
							if team != other.team && die == 0 && z == 0 {
								hp-=other.att*2;
							}
						}
					}
				}
			}
		}
	}
	else{//공중에 있을 때
		z+=zacc_;
		zacc_+=grav_;
	}
	//깊이 조정과 image_xscale 0 방지 룸 탈출 방지
	depth = -y;
	if image_xscale == 0
	image_xscale = 1;
	x = clamp(x,10,room_width-10);
	y = clamp(y,10,room_height-50);
	//알람 0 설정
	if alarm_[0] >= 0 {
		if alarm_[0] == 0{
			if die == 1{
				sprite_index = Spr_Grave;
			}
			else if atdelay = 1 {
				atdelay = 0;
			}
		}
		alarm_[0]--;
	}
	//
}
else {//퍼즈
	image_speed = 0;
}