extends Area3D

@onready var task = $"../../Control/Task1"

func _on_body_entered(body):
	task.play("show")


func _on_body_exited(body):
	task.play("hide")