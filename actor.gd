#ACTOR.GD
class_name Actor

var controller #0 = AI, 1 = player
var title
var chunk: Vector2i

func _init(setcontroller = 0, settitle = "unnamed", setchunk=Vector2i(0,0)):
	controller = setcontroller
	title = settitle
	chunk = setchunk

func setchunk(destination: Vector2i):
	if destination.x>=0 and destination.y>=0 and destination.x<World.mapsize.x and destination.y<World.mapsize.y:
		chunk=destination
		print(title+' moved to '+str(destination))
	else:
		print(title+' cannot move outside of world bounds')

func movechunk(directionvector: Vector2i):
	setchunk(chunk+directionvector)
