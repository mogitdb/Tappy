extends Node2D

@export var pipes_scene: PackedScene


@onready var spawn_lower = $SpawnLower
@onready var spawn_upper = $SpawnUpper
@onready var spawn_timer = $SpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos = randf_range(
		spawn_upper.position.y,
		spawn_lower.position.y
	)
	new_pipes.position = Vector2(spawn_lower.position.x,y_pos)
	add_child(new_pipes)

func stop_pipes() -> void:
	spawn_timer.stop()
	var pipes = get_tree().get_nodes_in_group("pipes")
	for pipe in pipes:
		pipe.set_process(false)

func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_plane_died():
	stop_pipes()
