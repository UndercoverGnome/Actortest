#GAME.GD
extends Node

var tickTimer = 0.0
var tickRateAverage = 0
var tick_count = 0
var elapsed_seconds = 0

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

func drawChunk(position:Vector2i, size, tempheight):
	var ground_mesh = MeshInstance3D.new()
	ground_mesh.position=Vector3(position.x*size,tempheight,position.y*size)
	ground_mesh.mesh = PlaneMesh.new()
	ground_mesh.mesh.size=Vector2(size,size)
	ground_mesh.mesh.center_offset=Vector3(size/2,0,size/2)
	add_child(ground_mesh)

func cameraMovement(delta):
	var forward = -camera.global_transform.basis.z.normalized()
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

func _ready():
	for x in range(World.chunks.size()):
		for y in range(World.chunks[x].size()):
			drawChunk(Vector2(x, y), 4, World.chunks[x][y].temptestingheight*1)


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
