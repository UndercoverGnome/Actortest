#GAME.GD
extends Node

var tickTimer = 0.0
var tickRateAverage = 0
var tick_count = 0
var elapsed_seconds = 0
var drawnChunks = []
var loadedChunks = []

@export var camera: Node

func playerChunkMovement():
	if Input.is_action_just_pressed("ui_up"):
		World.player.moveChunk(Vector2i(0,-1))
	if Input.is_action_just_pressed("ui_down"):
		World.player.moveChunk(Vector2i(0,1))
	if Input.is_action_just_pressed("ui_left"):
		World.player.moveChunk(Vector2i(-1,0))
	if Input.is_action_just_pressed("ui_right"):
		World.player.moveChunk(Vector2i(1,0))

func tickChunks():
	for chunkcolumn in World.chunks:
		for chunk in chunkcolumn:
			chunk.tick()

func drawChunk(position:Vector2i, size):
	var ground = MeshInstance3D.new()
	ground.position=Vector3(position.x*size,0,position.y*size)
	ground.mesh = PlaneMesh.new()
	ground.mesh.size=Vector2(size/1.01,size/1.01)#TEMP
	ground.mesh.center_offset=Vector3(size/2,0,size/2)
	add_child(ground)
	return ground

func cameraMovement(delta):
	var forward = -camera.global_transform.basis.z.normalized()
	forward.y = 0
	var right = camera.global_transform.basis.x.normalized()

	if Input.is_action_pressed("w"):
		camera.position += forward* Config.cameraSpeed * delta
	if Input.is_action_pressed("s"):
		camera.position -= forward* Config.cameraSpeed * delta
	if Input.is_action_pressed("a"):
		camera.position -= right* Config.cameraSpeed * delta
	if Input.is_action_pressed("d"):
		camera.position += right* Config.cameraSpeed * delta

	if Input.is_action_pressed('shift'):
		camera.position.y+=delta*Config.cameraSpeed
	if Input.is_action_pressed("control"):
		camera.position.y-=delta*Config.cameraSpeed

	if Input.is_action_pressed('ui_up'):
		camera.rotation.x+=delta*Config.cameraRotationSpeed
		if camera.rotation.x>PI/2:
			camera.rotation.x=PI/2
	if Input.is_action_pressed('ui_down'):
		camera.rotation.x-=delta*Config.cameraRotationSpeed
		if camera.rotation.x<-PI/2:
			camera.rotation.x=-PI/2
	if Input.is_action_pressed('ui_left'):
		camera.rotation.y+=delta*Config.cameraRotationSpeed
	if Input.is_action_pressed('ui_right'):
		camera.rotation.y-=delta*Config.cameraRotationSpeed
	World.player.setChunk(Vector2i(floor(camera.position.x/Config.chunksize),floor(camera.position.z/Config.chunksize)))

func get_loaded_chunks(radius: int) -> Array:
	var loaded_chunks := []

	for x in range(
		World.player.chunkpos.x - radius,
		World.player.chunkpos.x + radius + 1
	):
		for y in range(
			World.player.chunkpos.y - radius,
			World.player.chunkpos.y + radius + 1
		):
			if x >= 0 and y >= 0 and x < World.mapsize.x and y < World.mapsize.y:
				loaded_chunks.append(World.chunks[x][y])

	return loaded_chunks

func _ready():
	camera.position=Vector3(World.player.chunkpos.x*Config.chunksize,10,World.player.chunkpos.y*Config.chunksize)
	print(camera.position)


func _process(delta):
	if Input.is_action_just_pressed('stresstest'):
		for x in 1000:
			var tempactor=Humanoid.new()
			tempactor.sex=randi_range(0,1)
			if(tempactor.sex==0):
				tempactor.title=Config.masculineForenames.pick_random()+" "+Config.surnames.pick_random()
			elif(tempactor.sex==1):
				tempactor.title=Config.feminineForenames.pick_random()+" "+Config.surnames.pick_random()
			else:
				tempactor.title="unnamed"
			tempactor.health=100
			tempactor.chunkpos=Vector2i(0,0)
			World.chunks[0][0].addActor(tempactor)

	#playerChunkMovement()
	cameraMovement(delta)


	#SHOULD BE ON CHUNK MOVE (LATER)
	for chunk in drawnChunks:
		chunk.queue_free()
	drawnChunks.clear()
	loadedChunks.clear()

	loadedChunks = get_loaded_chunks(Config.renderDistance)
	drawnChunks = []
	#print(loadedChunks)
	for chunk in loadedChunks:
		drawnChunks.append(drawChunk(Vector2(chunk.chunkid.x, chunk.chunkid.y), Config.chunksize))


	tickTimer += delta
	elapsed_seconds += delta

	if tickTimer >= Config.tickRate:
		tick()
		tickTimer -= Config.tickRate
		tick_count += 1

	if elapsed_seconds >= 1.0:
		tickRateAverage = round((tick_count / elapsed_seconds)*10000)/10000
		tick_count = 0
		elapsed_seconds = 0.0

	DisplayServer.window_set_title("Actortest 0.2 | Game | "+str(Engine.get_frames_per_second())+"fps, "+str(tickRateAverage)+' tps')

func tick():
	tickChunks()


func _on_editor_button_pressed():
	get_tree().change_scene_to_file('res://editor.tscn')
