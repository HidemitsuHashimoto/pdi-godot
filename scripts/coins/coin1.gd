extends Area3D

@onready var task = $"../../Control/Task1"
var isEntered = false
var show = false
var hide = true

func _process(delta):
	if(isEntered && hide && Input.is_action_pressed("cheer")):
		task.play("show")
		show = true
		hide = false
		
	if(show && Input.is_action_just_pressed("exit")):
		task.play("hide")
		show = false
		hide = true

func _on_body_entered(body):
	get_node("AreaEnterText").visible = true
	isEntered = true


func _on_body_exited(body):
	get_node("AreaEnterText").visible = false
	isEntered = false
	
