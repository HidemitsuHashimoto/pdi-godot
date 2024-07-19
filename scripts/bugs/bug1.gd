extends Area3D

@onready var bug = $"../../Control/Bug1"

func _on_body_entered(body):
	bug.play("show")


func _on_body_exited(body):
	bug.play("hide")
