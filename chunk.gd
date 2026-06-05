#CHUNK.GD
class_name Chunk

var title
var actors
var chunkid: Vector2i

func _init(setchunkid, settitle = Config.phoneticalphabet.pick_random()+"-"+Config.phoneticalphabet.pick_random(), setactors = []):
	chunkid = setchunkid
	title = settitle
	actors = setactors

func addActor(actortoadd):
	actors.append(actortoadd)

func updateActorChunk(actor):
	print('updatedactor')
	if actor.chunkpos != chunkid:
		#print(str(chunkid)+" fixing misalignment between actor.chunk and actor's world chunk array location")
		World.chunks[actor.chunkpos.x][actor.chunkpos.y].addActor(actor)
		var actorarraylocation = actors.find(actor)
		actors.pop_at(actorarraylocation)

func tick():
	var actors_to_transfer = []
	for actor in actors:
		if actor != World.player:
			actor.moveChunk(
				Vector2i(
					randi_range(-1,1),
					randi_range(-1,1)
				)
			)

		if actor.chunkpos != chunkid:
			actors_to_transfer.append(actor)

	for actor in actors_to_transfer:
		updateActorChunk(actor)
