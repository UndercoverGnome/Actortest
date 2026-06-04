#WORLD.GD - Autoloaded
extends Node

var player: Actor

#CONFIGURABLE
const mapsize = Vector2i(8, 8)

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
		randi_range(0,1),
		"Play Er",
		30,
		Vector2(0,0)
		)
	chunks[0][0].addActor(player)

func isValidChunk(pos: Vector2i):
	return pos.x >= 0 and pos.y >= 0 and pos.x < mapsize.x and pos.y < mapsize.y
