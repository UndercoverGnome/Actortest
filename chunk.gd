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

func tick():
	for actor in actors:
		if actor.chunk != chunkid:
			print("misalign")
			World.chunks[actor.chunk.x][actor.chunk.y].addactor(actor)
			var actorarraylocation = actors.find(actor)
			actors.pop_at(actorarraylocation)
