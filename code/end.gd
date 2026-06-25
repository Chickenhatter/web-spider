extends Node2D
var up = false
var down = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RichTextLabel.add_theme_font_size_override("font_size", 400)
	await get_tree().create_timer(2).timeout
	down = false
	await get_tree().create_timer(2).timeout
	up = true
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file('res://scenes/start.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if up == true:
		$Sprite2D2.self_modulate.a += 0.01
	if down == true:
		$Sprite2D2.self_modulate.a -= 0.01
