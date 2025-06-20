extends Area2D

@export var trap_owner: Node = null  # The player who placed the trap
@export var damage: int = 1
@onready var trigger = $TriggerAudio

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
		# Don't trigger on the owner
	if body == trap_owner:
		return
	if body.is_in_group("player"):
		# Apply effect (e.g., damage)
		if body.has_method("immobilize"):
			body.immobilize(5)
			trigger.play()

		print("Trap triggered by:", body.name)
		queue_free()
