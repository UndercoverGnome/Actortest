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
	if actor.chunkpos == chunkid:
		return

	actors.erase(actor)

	var dest = World.chunks[actor.chunkpos.x][actor.chunkpos.y]
	if not dest.actors.has(actor):
		dest.addActor(actor)

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
