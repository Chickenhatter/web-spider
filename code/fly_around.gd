extends Node2D

var size_down = false
var size_up = false

var xplace = 0
var yplace = 0
var inweb = false
var bug_fly_up = false
const flyscene = preload("res://scenes/fly.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$place/Node2D/Node2D.scale.x = 0.01
	$place/Node2D/Node2D.scale.y = 0.01
	spider_place()

var a = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if size_up == true:
		a += 1
		$place/Node2D/Node2D.scale.x += 0.0021
		$place/Node2D/Node2D.scale.y += 0.0021
	if size_down == true:
		$place/Node2D/Node2D.scale.x -= 0.005
		$place/Node2D/Node2D.scale.y -= 0.005

func spider_place():
	size_up = true
	xplace = randf_range(300,5460)
	yplace = randf_range(300,2940)
	$place.position.x = xplace
	$place.position.y = yplace
	bug_fly_up = true
	await get_tree().create_timer(8.0).timeout
	size_up = false
	size_down = true
	bug_fly_up = false
	for area in $place/flybug.get_overlapping_areas():
		if area.name == "Web":
			inweb = true
	if inweb == true:
		websummon()
		$place.position.y = 1000
		$place.position.x = -1000
	await get_tree().create_timer(2.0).timeout
	size_down = false
	$place.position.y = 1000
	$place.position.x = -1000
	await get_tree().create_timer(5.0).timeout
	for child in $"../Flyparent".get_children():
			child.queue_free()
	$place/Node2D/Node2D.scale.x = 0.01
	$place/Node2D/Node2D.scale.y = 0.01
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
