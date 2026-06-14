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
	xplace = randf_range(300,5460)
	yplace = randf_range(300,2940)
	$place.position.x = xplace
	$place.position.y = yplace
	bug_fly_up = true
	await get_tree().create_timer(8.0).timeout
	bug_fly_up = false
	for area in $place/flybug.get_overlapping_areas():
		if area.name == "Web":
			inweb = true
			print('true')
	if inweb == true:
		websummon()
		$place.position.y = 100
		$place.position.x = -100
	await get_tree().create_timer(2.0).timeout
	$place.position.y = 100
	$place.position.x = -100
	await get_tree().create_timer(5.0).timeout
	for child in $"../Flyparent".get_children():
			child.queue_free()
	
	spider_place()

func websummon():
	var fly = flyscene.instantiate()
	fly.global_position = $place.global_position
	fly.global_rotation = $place.global_rotation
	var flyparent = $"../Flyparent"
	flyparent.add_child(fly)


func _on_flybug_area_entered(area: Area2D) -> void:
	if area.name == "Web":
		inweb = true


func _on_flybug_area_exited(area: Area2D) -> void:
	if area.name == "Web":
		inweb = false
