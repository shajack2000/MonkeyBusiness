extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var mouse_sensitivity : float = 0.1

@export_group("Nodes")
@export var HEAD : Node3D

@export_group("Controls")
@export var JUMP : String = "ui_accept"
@export var LEFT : String = "KEY_A"
@export var RIGHT : String = "KEY_D"
@export var FORWARD : String = "KEY_W"
@export var BACKWARD : String = "KEY_S"
@export var PAUSE : String = "ui_cancel"
@export var CROUCH : String
@export var SPRINT : String

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector(LEFT, RIGHT, FORWARD, BACKWARD)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var jump_modifier = 1
	if not is_on_floor():
		jump_modifier = 0.5
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * jump_modifier)
		velocity.z = move_toward(velocity.z, 0, SPEED * jump_modifier)

	move_and_slide()
	
#func _process(_delta):
	#HEAD.rotation.x = clamp(HEAD.rotation.x, deg_to_rad(-90), deg_to_rad(90))
	
#func _input(event):
	#if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		#self.rotation_degrees.y -= event.relative.x * mouse_sensitivity
		#HEAD.rotation_degrees.x -= event.relative.y * mouse_sensitivity

