extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= delta * GameManager.SCROLL_SPEED

func on_plane_died():
	set_process(false)
