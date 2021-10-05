extends Node

var camera = null

var score = 0
signal changed
var scores = {
	0:0,
	1:0,
	2:0,
	3:10,
	4:20,
	5:50,
	6:100,
	7:200,
	8:300,
	9:1000
}

func _ready():
	randomize()	

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()

func change_score(s):
	score += s
	emit_signal("changed")
	if camera == null:
		camera = get_node_or_null("/root/Game/Camera")
	if camera != null:
		camera.add_trauma(s/20.0)
		
	if score >= 100:
		var _scene = get_tree().change_scene("res://Die.tscn")
   
