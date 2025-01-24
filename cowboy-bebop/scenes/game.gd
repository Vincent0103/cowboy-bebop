extends Node2D
@onready var bullet = preload("res://scenes/area_2d.tscn")

var bullet_scene :PackedScene
var player : Node2D

func _ready():
	player = get_node("/root/Game/Player")
	if player :
		print("Joueur trouve",player.position)
	else :
		print ("Joueur non trouve")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var bullet_temp = bullet.instantiate()
		bullet_temp.position = player.position
		bullet_temp.direction = -1
		add_child(bullet_temp)
