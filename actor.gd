#ACTOR.GD
class_name Actor

var controller #0 = AI, 1 = player
var sex
var title
var health
var chunk: Vector2i

func _init(setcontroller = 0, setsex = randi_range(0,1), settitle = "unnamed", sethealth = 30, setchunk=Vector2i(0,0)):
	controller = setcontroller
	sex = setsex
	title = settitle
	health = sethealth
	chunk = setchunk

func setchunk(destination: Vector2i):
	if destination.x>=0 and destination.y>=0 and destination.x<World.mapsize.x and destination.y<World.mapsize.y:
		chunk=destination
		print(title+' moved to '+str(destination))
	else:
		print(title+' cannot move outside of world bounds')

func movechunk(directionvector: Vector2i):
	setchunk(chunk+directionvector)

