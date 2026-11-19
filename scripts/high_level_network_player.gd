extends CharacterBody2D

const SPEED: float = 500.0

func _enter_tree() -> void:
	# Set the authority of this player node to the current client
	set_multiplayer_authority(name.to_int())

func _physics_process(delta: float) -> void:
	# Only run this code in the owning client
	if !is_multiplayer_authority(): return
	
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * SPEED
	
	move_and_slide()
	
