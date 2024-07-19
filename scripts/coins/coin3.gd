extends Area3D

@onready var task = $"../../Control/Task3"

func _on_body_entered(body):
	task.play("show")


func _on_body_exited(body):
	task.play("hide")
