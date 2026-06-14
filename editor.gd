#EDITOR.GD
extends Node

var tile = Vector2(0, 0)

func _ready():
	$EditorUI.selectedtilepos = tile

func _process(_delta):
	DisplayServer.window_set_title("Actortest 0.2 | Editor | "+str(Engine.get_frames_per_second())+"fps")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var previoustile = tile
			tile = Vector2(floor(event.position.x/Config.uitilesize), floor(event.position.y/Config.uitilesize))
			if tile.x<World.mapsize.x and tile.x>=0 and tile.y<World.mapsize.y and tile.y>=0:
				pass
			else:
				tile=previoustile
			$EditorUI.selectedtilepos = tile

func _on_add_actor_button_pressed():
	var tempactor=Humanoid.new()
	tempactor.sex=randi_range(0,1)
	if(tempactor.sex==0):
		tempactor.title=Config.masculineForenames.pick_random()+" "+Config.surnames.pick_random()
	elif(tempactor.sex==1):
		tempactor.title=Config.feminineForenames.pick_random()+" "+Config.surnames.pick_random()
	else:
		tempactor.title="unnamed"

	tempactor.health=100
	tempactor.chunkpos=Vector2i(tile.x,tile.y)
	tempactor.position=Vector3(0,0,0)
	World.chunks[tile.x][tile.y].actors.append(tempactor)

func _on_play_button_pressed():
	get_tree().change_scene_to_file('res://game.tscn')
