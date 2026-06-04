#GAME.GD
extends Node

func _process(_delta):
	DisplayServer.window_set_title("Actortest 0.2 | Game | "+str(Engine.get_frames_per_second())+"fps")

	if Input.is_action_just_pressed("ui_up"):
		World.player.movechunk(Vector2i(0,-1))
	if Input.is_action_just_pressed("ui_down"):
		World.player.movechunk(Vector2i(0,1))
	if Input.is_action_just_pressed("ui_left"):
		World.player.movechunk(Vector2i(-1,0))
	if Input.is_action_just_pressed("ui_right"):
		World.player.movechunk(Vector2i(1,0))

	for chunkcolumn in World.chunks:
		for chunk in chunkcolumn:
			chunk.tick()


func _on_editor_button_pressed():
	get_tree().change_scene_to_file('res://editor.tscn')
