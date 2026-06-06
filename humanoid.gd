#HUMANOID.GD
class_name Humanoid extends Actor

var health
var sex

func _init(title = "unnamed", chunk=Vector2i(0,0), positon=Vector3(0,0,0), sex = randi_range(0,1),  health = 30):
	super(title, chunk, position)
	self.sex = sex
	self.health = health
