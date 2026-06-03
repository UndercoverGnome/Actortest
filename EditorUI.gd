extends Control

var font = ThemeDB.fallback_font
const tilesize = Config.uitilesize
var selectedtilepos = Vector2(0,0)

func _draw():
	for x in range(World.mapsize.x):
		for y in range(World.mapsize.y):
			var pos = Vector2(x * tilesize, y * tilesize)
			draw_rect(Rect2(pos, Vector2(tilesize, tilesize)),Color(float(x) / float(World.mapsize.x),float(y) / float(World.mapsize.y), 0, 1), true)
			draw_rect(Rect2(pos, Vector2(tilesize, tilesize)),Color(1, 1, 1, 1), false)

	draw_rect(Rect2(Vector2(selectedtilepos.x*tilesize,selectedtilepos.y*tilesize), Vector2(tilesize, tilesize)),Color(0, 0, 1, 1), true) #DRAW TILESELECTIONINDICATOR
	draw_string(font, Vector2(0,(World.mapsize.y*tilesize)+16), "mapsize:"+str(World.mapsize), HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)
	draw_string(font, Vector2(0,(World.mapsize.y*tilesize)+32), "tiles:"+str(World.mapsize.x*World.mapsize.y), HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)

	draw_rect(Rect2(Vector2(selectedtilepos.x*tilesize,selectedtilepos.y*tilesize), Vector2(tilesize, tilesize)),Color(0, 0, 1, 1), true)#drawplayerrepresentation

	#DRAW SELECTED TILE INSPECTOR
	draw_string(font, Vector2((World.mapsize.x*tilesize),16), "selectedtile:"+str(selectedtilepos), HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)
	draw_string(font, Vector2((World.mapsize.x*tilesize),32), "title:"+str(World.chunks[selectedtilepos.x][selectedtilepos.y].title), HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)
	for x in range(World.chunks[selectedtilepos.x][selectedtilepos.y].actors.size()):
		draw_string(font, Vector2((World.mapsize.x*tilesize),64+(x*16)), World.chunks[selectedtilepos.x][selectedtilepos.y].actors[x].title, HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)

func _process(_delta):
	queue_redraw()
