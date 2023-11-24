if pause == false {
	if tt < 60 {
		tt++;
		x += ( x_t - xx ) / 60;
		y += ( y_t - yy ) / 60;
		z+=zacc_;
		zacc_+=grav_;
		image_angle = point_direction(0,z,(x_t-xx)/60,z+zacc_);
		depth = -990;
	}
	else if (image_index == 0) {
		var inst_;
		inst_ = -4;
		with(Obj_Unitpar){
			if team != other.team && die == 0{
				if inst_ = -4 {
					inst_ = id;
					continue;
				}
				if point_distance(other.x,other.y,inst_.x,inst_.y)-inst_.width/2 > point_distance(other.x,other.y,x,y)-inst_.width/2 {
					inst_ = id;
				}
			}
		}
		if inst_ != -4 && point_distance(x,y,inst_.x,inst_.y) <= 3 {
			inst_.hp-=dmg;
			instance_destroy();
		}
		image_index = 1;
		image_angle = 0;
		depth = -y;
	
	}
	else {
		image_alpha -= 1/60;
		if image_alpha <= 0
		instance_destroy();
	}
}
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