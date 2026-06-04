#HUMANOID.GD
class_name Humanoid extends Actor

var health
var sex

func _init(setsex = randi_range(0,1), settitle = "unnamed", sethealth = 30, setchunk=Vector2i(0,0)):
	super(settitle, setchunk)
	sex = setsex
	health = sethealth
