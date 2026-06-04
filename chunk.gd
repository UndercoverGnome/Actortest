#CHUNK.GD
class_name Chunk

var title
var actors
var chunkid: Vector2i

func _init(setchunkid, settitle = Config.phoneticalphabet.pick_random()+"-"+Config.phoneticalphabet.pick_random(), setactors = []):
	chunkid = setchunkid
	title = settitle
	actors = setactors

func addactor(actortoadd):
	actors.append(actortoadd)

func alignActorWithChunk(actor):
	if actor.chunk != chunkid:
		print(str(chunkid)+" fixing misalignment between actor.chunk and actor's world chunk array location")
		World.chunks[actor.chunk.x][actor.chunk.y].addactor(actor)
		var actorarraylocation = actors.find(actor)
		actors.pop_at(actorarraylocation)

func tick():
	for actor in actors:
		actor.movechunk(Vector2i(randi_range(-1,1),randi_range(-1,1)))
		alignActorWithChunk(actor)
