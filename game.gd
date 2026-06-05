#GAME.GD
extends Node

var tickTimer = 0.0
var tickRateAverage = 0
var tick_count = 0
var elapsed_seconds = 0

func _ready():
	#drawChunks()
	pass

func _process(delta):
	playerChunkMovement()
	tickTimer += delta
	elapsed_seconds += delta


	if tickTimer >= Config.tickRate:
		tickChunks()
		tickTimer -= Config.tickRate
		tick_count += 1

	if elapsed_seconds >= 1.0:
		tickRateAverage = round((tick_count / elapsed_seconds)*10000)/10000
		tick_count = 0
		elapsed_seconds = 0.0

	DisplayServer.window_set_title("Actortest 0.2 | Game | "+str(Engine.get_frames_per_second())+"fps, "+str(tickRateAverage)+' tps')


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

func drawChunks():
	var ground = StaticBody3D.new()
	add_child(ground)
	var ground_mesh = MeshInstance3D.new()
	ground.add_child(ground_mesh)
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = Vector2(16, 16)
	ground_mesh.mesh = plane_mesh
	var collision_shape = CollisionShape3D.new()
	ground.add_child(collision_shape)
	var box_shape = BoxShape3D.new()
	box_shape.size = Vector3(16, 1, 16)
	collision_shape.shape = box_shape

func _on_editor_button_pressed():
	get_tree().change_scene_to_file('res://editor.tscn')
