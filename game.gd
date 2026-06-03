#GAME.GD
extends Node

func _process(_delta):
	DisplayServer.window_set_title("Actortest 0.2 | Game | "+str(Engine.get_frames_per_second())+"fps")
	if Input.is_action_pressed("ui_up"):
		World.player.chunk.x+=1#BROKEN BECAUSE I NEED TO UPDATE CHUNK STORED POSITION TOO (IE ACTOR IN CHUNK)
	print(World.player.chunk)
