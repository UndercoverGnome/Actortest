#ACTOR.GD
class_name Actor

var controller #0 = AI, 1 = player
var sex
var title
var health

func _init(setcontroller = 0, setsex = randi_range(0,1), settitle = "unnamed", sethealth = 30):
	controller = setcontroller
	sex = setsex
	title = settitle
	health = sethealth
