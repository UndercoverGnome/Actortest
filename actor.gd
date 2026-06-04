#ACTOR.GD
#PLANNED TYPES OF ACTOR:
#Humanoid, Creature, Vehicle, Item, Projectile
class_name Actor

var title
var chunkpos: Vector2i

func _init(settitle = "unnamed", setchunk=Vector2i(0,0)):
	title = settitle
	chunkpos = setchunk

func setChunk(destination: Vector2i):
	if World.isValidChunk(destination):
		chunkpos=destination
		#print(title+' moved to '+str(destination))
	else:
		pass
		#print(title+' cannot move outside of world bounds')

func moveChunk(directionvector: Vector2i):
	setChunk(chunkpos+directionvector)
