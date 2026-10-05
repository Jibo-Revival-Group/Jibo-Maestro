extends Node3D

@onready var BaseNode = $Base
@onready var PelvisNode = $Pelvis
@onready var TorsoNode = $Pelvis/TorsoJoint/Torso
@onready var HeadNode = $Pelvis/TorsoJoint/Torso/Node3D/Head

@export var PelvisRot = 0.0
@export var TorsoRot = 0.0
@export var HeadRot = 0.0



func _ready() -> void:
	print("New Jibo puppet!")
	PelvisNode.rotation = Vector3(0,PelvisRot,0)
	TorsoNode.rotation = Vector3(0,TorsoRot,0)
	HeadNode.rotation = Vector3(0,HeadRot,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
