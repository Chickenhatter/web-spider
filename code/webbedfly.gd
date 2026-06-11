extends CharacterBody2D
var spider_in = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if spider_in == true:
		if Input.is_action_just_pressed('ui_g'):
			Trader.backrestart = true
			queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Spider":
		spider_in = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Spider":
		spider_in = false
