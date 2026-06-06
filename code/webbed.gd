extends Area2D
var spider: Node2D
var going = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spinder = get_tree().get_nodes_in_group('spider')
	if spinder.size() > 0:
		spider = spinder[0] as Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if going == true:
		if get_tree().current_scene.scene_file_path == "res://scenes/main.tscn":
			print('a')
			$".".look_at($"../../Spider/Spider/Node2D")
