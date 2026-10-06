extends Panel

var time_labels: Array[Label] = []
@onready var choreo_time: Panel = $ChoreoTime
@onready var timeline_bg: Panel = $"../../Timeline/bg"
@onready var timeline_scrollbox: ScrollContainer = $"../../Timeline"
@onready var time_manager: Node = $"../.."

func _ready() -> void:
	gui_input.connect(_on_ruler_gui_input)
	choreo_time.gui_input.connect(_on_choreotime_gui_input)
	update_ruler()

func update_ruler() -> void:
	# Clear existing labels 
	for label in time_labels:
		label.queue_free()
	time_labels.clear()
	
	# Update Ruler, ChoreoTime, and timeline bg width based on duration
	var total_width = time_manager.duration * time_manager.pixels_per_second
	custom_minimum_size.x = total_width
	choreo_time.custom_minimum_size.x = total_width
	timeline_bg.custom_minimum_size.x = total_width
	
	# Create time labels inside ChoreoTime
	var total_seconds = int(time_manager.duration)
	for i in range(total_seconds + 1):
		var label = Label.new()
		label.text = str(i) + "s"
		label.position = Vector2(i * time_manager.pixels_per_second, 10)
		choreo_time.add_child(label)
		time_labels.append(label)

func _process(_delta: float) -> void:
	$"..".scroll_horizontal = timeline_scrollbox.scroll_horizontal

func _on_ruler_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var local_x = get_local_mouse_position().x
		var time_seconds = local_x / time_manager.pixels_per_second
		time_manager.set_time(time_seconds)

func _on_choreotime_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var local_x = choreo_time.get_local_mouse_position().x
		var time_seconds = local_x / time_manager.pixels_per_second
		time_manager.set_time(time_seconds)

func _on_choreo_duration_value_changed(value: float) -> void:
	time_manager.set_duration(value)
	update_ruler()
