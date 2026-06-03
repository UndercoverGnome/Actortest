#CHUNK.GD
class_name Chunk

var title
var actors

func _init(settitle = Config.phoneticalphabet.pick_random()+"-"+Config.phoneticalphabet.pick_random(), setactors = []):
	title = settitle
	actors = setactors

func addactor(actortoadd):
	actors.append(actortoadd)
