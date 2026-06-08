extends Node2D
var xplace = 0
var yplace = 0
var inweb = false
var bug_fly_up = false
const flyscene = preload("res://scenes/fly.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spider_place()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spider_place():
	xplace = randf_range(0,5760)
	yplace = randf_range(0,3240)
	$place.position.x = xplace
	$place.position.y = yplace
	bug_fly_up = true
	await get_tree().create_timer(5.0).timeout
	bug_fly_up = false
	if ineweb == true:
		$place.position.y = 100
		$place.position.x = -100
	await get_tree().create_timer(5.0).timeout
	$place.position.y = 100
	$place.position.x = -100
	await get_tree().create_timer(20.0).timeout 
	spider_place()


func _on_flybug_area_entered(area: Area2D) -> void:
	if area.name == "Web":
		inweb = true


func _on_flybug_area_exited(area: Area2D) -> void:
	if area.name == "Web":
		inweb = false
