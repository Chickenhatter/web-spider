extends CharacterBody2D
var spider: Node2D
var going = true
var base_place = false
var base_web_true = $".".global_position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spinder = get_tree().get_nodes_in_group('spider')
	if spinder.size() > 0:
		spider = spinder[0] as Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if going == true:
		if get_tree().current_scene.scene_file_path == "res://scenes/main.tscn":
			if base_place == false:
				base_place = true
				base_web_true = $".".global_position
			print('a')
			var spider_pos = spider.global_position
			var web_base = $".".global_position
			$".".look_at(spider_pos)
			scale.x = sqrt(((spider_pos.x - web_base.x)*(spider_pos.x - web_base.x)) + ((spider_pos.y - web_base.y)*(spider_pos.y - web_base.y)))/2
			$".".global_position.x = (base_web_true.x + spider_pos.x)/2
			$".".global_position.y = (base_web_true.y + spider_pos.y)/2
			

func _unhandled_input(event):
	if event.is_action_pressed("ui_t"):
		if Trader.dans_area == true:
			await get_tree().create_timer(0.1).timeout
			if Trader.dans_area == true:
				if going == true:
					going = false
					$fall.name = 'Web'
					Trader.holding_web = 1
