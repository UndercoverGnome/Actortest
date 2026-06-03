#GAME.GD
extends Node

func _process(_delta):
	DisplayServer.window_set_title("Actortest 0.2 | Game | "+str(Engine.get_frames_per_second())+"fps")
