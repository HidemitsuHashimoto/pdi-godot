extends Node3D

@export var target: CharacterBody3D
@onready var camera = $Camera

var zoom = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	self.position = self.position.lerp(target.position, delta * 4)
	camera.position = camera.position.lerp(Vector3(0, 0, zoom), 8 * delta)
