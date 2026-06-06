#ACTOR.GD
#PLANNED TYPES OF ACTOR:
#Humanoid, Creature, Vehicle, Item, Projectile
class_name Actor

var title
var chunkpos: Vector2i

func _init(title = "unnamed", chunkpos = Vector2i.ZERO):
	self.title = title
	self.chunkpos = chunkpos

func setChunk(destination: Vector2i):
	if World.isValidChunk(destination):
		chunkpos=destination
		#print(title+' moved to '+str(destination))
	else:
		pass
		#print(title+' cannot move outside of world bounds')

func moveChunk(directionvector: Vector2i):
	setChunk(chunkpos+directionvector)
