#GAME.GD
extends Node

func _process(_delta):
	DisplayServer.window_set_title("Actortest 0.2 | Game | "+str(Engine.get_frames_per_second())+"fps")
	if Input.is_action_pressed("ui_up"):
		World.player.chunk=Vector2i(0,1)
	for chunkcolumn in World.chunks:
		for chunk in chunkcolumn:
			chunk.tick()
