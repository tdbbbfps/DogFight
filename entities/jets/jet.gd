extends CharacterBody2D
class_name Jet

# Jet stats
@export var max_hp : float = 100.0:
	set(value):
		max_hp = value
var hp : float = max_hp:
	set(value):
		hp = value

# Speed parameter
@export var max_speed : float = 500.0 # Jet's maximum speed
@export var min_speed : float = 100.0  # Jet's minimum speed`
@export var accel : float = 100.0
@export var decel : float = 50.0
var current_speed : float = 0.0
@export var rotation_speed : float = 5.0

# Jet component
@export var engine : JetEngine
@export var wing : JetWing
@export var weapon : JetWeapon
@export var body : JetBody
