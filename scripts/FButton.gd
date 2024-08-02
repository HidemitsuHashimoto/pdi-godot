extends TextureButton

func _on_button_down():
	Input.action_press("cheer")

func _on_button_up():
	Input.action_release("cheer")
