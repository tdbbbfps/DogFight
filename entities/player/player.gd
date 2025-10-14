extends CharacterBody2D

# Movement parameters.
@export var max_speed : float = 500.0
@export var accel : float = 100.0
@export var decel : float = 50.0
var current_speed : float = 0.0

@export var rotation_speed : float = 5.0

func _physics_process(delta: float) -> void:
	handle_flight(delta)
	handle_rotation(delta)
	velocity = transform.x * current_speed
	move_and_slide()
	
func handle_flight(delta : float) -> void:
	"""當玩家按住加速鍵(W)時開始加速至最大速度，放開後減速直到速度歸0。"""
	if Input.is_action_pressed("Accelerate"):
		current_speed = move_toward(current_speed, max_speed, accel * delta)
	else:
		current_speed = move_toward(current_speed, 0, decel * delta)
	print(current_speed)
		
func handle_rotation(delta : float) -> void:
	"""使玩家轉向滑鼠方向"""
	var mouse_pos = get_global_mouse_position()
	var dir = (mouse_pos - global_position).normalized()
	var target_angle = dir.angle()
	var current_angle = rotation
	var angle_diff = angle_difference(current_angle, target_angle)
	var rotation_amount = sign(angle_diff) * min(abs(angle_diff), rotation_speed * delta)
	rotation += rotation_amount
