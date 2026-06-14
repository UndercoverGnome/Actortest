#WORLD.GD - Autoloaded
extends Node

var player: Actor

#CONFIGURABLE
const mapsize = Vector2i(16, 16)#8,8
const chunksize = 128

var chunks:Array = []

func _ready():
	initializeChunks()
	initializePlayer()

func initializeChunks():
	chunks.clear()
	for x in range(mapsize.x):
		var column = []
		for y in range(mapsize.y):
			column.append(
				Chunk.new(Vector2i(x,y),
				Config.phoneticalphabet[x % 26]+str(x/26)+'-'+Config.phoneticalphabet[y % 26]+str(y/26))
				)
		chunks.append(column)

func initializePlayer():
	player = Humanoid.new(
		"Play Er",
		Vector2i(0,0),
		Vector3(0,0,0),
		randi_range(0,1),
		30
		)
	chunks[0][0].actors.append(player)

func isValidChunk(pos: Vector2i):
	return pos.x >= 0 and pos.y >= 0 and pos.x < mapsize.x and pos.y < mapsize.y

func getLoadedChunks(radius: int) -> Array:
	var loaded_chunks := []

	for x in range(
		player.chunkpos.x - radius,
		player.chunkpos.x + radius + 1
	):
		for y in range(
			player.chunkpos.y - radius,
			player.chunkpos.y + radius + 1
		):
			if x >= 0 and y >= 0 and x < mapsize.x and y < mapsize.y:
				loaded_chunks.append(chunks[x][y])

	return loaded_chunks
