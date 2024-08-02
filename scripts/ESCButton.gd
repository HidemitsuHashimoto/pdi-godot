extends TextureButton

func _on_button_down():
	Input.action_press("exit")

func _on_button_up():
	Input.action_release("exit")
